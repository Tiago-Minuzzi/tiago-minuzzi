import os
import sys
import numpy as np
import pandas as pd
import tensorflow as tf
from Bio import SeqIO
from numpy import array
from numpy import argmax
from warnings import simplefilter
from contextlib import redirect_stderr
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import OneHotEncoder

# Hide warning messages
simplefilter(action='ignore', category=FutureWarning)
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
with redirect_stderr(open(os.devnull, "w")):
  from tensorflow.keras.models import load_model
  from keras.preprocessing.sequence import pad_sequences

# Show full array and dataframe (without truncation)
pd.set_option('display.max_rows', None) # Show full data frame (without truncation)
np.set_printoptions(threshold=sys.maxsize) # Show full arrays (without truncation)

# I/O files
inp_arq = sys.argv[1]
out_arq = sys.argv[2] if len(sys.argv) >= 3 else None # Check whether the element exists
pad_ref = "fastas/pad_ref03.fasta"
tes_mdl = "models_hdf5/model_var01.05.wb.hdf5"

# Pre-processing functions
# Fasta to data frame
def fasta_frame(fasta_file,label):
  identifiers = []
  sequences = []
  with open(fasta_file) as f_f:
    for seq_record in SeqIO.parse(f_f, 'fasta'):
        identifiers.append(seq_record.id)
        sequences.append(seq_record.seq.lower())
  s1 = pd.Series(identifiers, name='ID')
  s2 = pd.Series(sequences, name='sequence')
  fasta_frame = pd.DataFrame(dict(ID=s1, sequence=s2))
  fasta_frame['label']=label
  return(fasta_frame)

# Sequence onehot encoding
def ohe_fun(fasta_df):
  integer_encoder = LabelEncoder()  
  one_hot_encoder = OneHotEncoder(categories='auto')   
  input_features = []

  for linha in fasta_df['sequence']:
    integer_encoded = integer_encoder.fit_transform(list(linha))
    integer_encoded = np.array(integer_encoded).reshape(-1, 1)
    one_hot_encoded = one_hot_encoder.fit_transform(integer_encoded)
    input_features.append(one_hot_encoded.toarray())
  input_features=pad_sequences(input_features, padding='post')
  input_features = np.stack(input_features)
  return(input_features)

# Sequence flattening
def flatten_sequence(pred_fasta_flat):
  dimensoes=pred_fasta_flat.shape
  n_samples=dimensoes[0]
  n_x=dimensoes[1]
  n_y=dimensoes[2]
  n_xy=(n_x * n_y)
  pred_fasta_flat=pred_fasta_flat.reshape(n_samples,n_xy)
  return(pred_fasta_flat)

# Input pre-processing
user_frame = fasta_frame(inp_arq,'?')
pad_frame = fasta_frame(pad_ref,'?')
u_f = [user_frame,pad_frame]
user_df = pd.concat(u_f,ignore_index=True)

# One hot encode and flat sequences
user_df_ohe = ohe_fun(user_df)
user_df_flat=flatten_sequence(user_df_ohe)

# Remove pad_ref
user_seq_to_pred = np.delete(user_df_flat, -1, 0)

# Load CNN model and predict
modelo = load_model(tes_mdl)
res_prob = modelo.predict_proba(np.expand_dims(user_seq_to_pred, axis=2), batch_size = 2)
res_label = modelo.predict_classes(np.expand_dims(user_seq_to_pred, axis=2), batch_size = 2)

# Format results
res_label_S = pd.Series(res_label)
res_prob_0 = pd.Series((res_prob[:,0])*100)
res_prob_1 = pd.Series((res_prob[:,1])*100)
user_ids = pd.Series(user_df['ID'][:-1])
results_dict = { 'ID': user_ids, 'Not TE prob': res_prob_0, 'TE prob': res_prob_1, 'Classification': res_label_S } 
results_df = pd.DataFrame(results_dict)
results_df.set_index('ID',inplace=True)
results_df['Classification'].replace(0,'NT',inplace=True)
results_df['Classification'].replace(1,'TE',inplace=True)

# Show prediction results
print("\n")
print("# RESULTS")
print(results_df)
print("\n")

# Write to file and show message
if out_arq:
    results_df.to_csv(out_arq)
    print(f"File saved as {out_arq}")
else:
    print("No output file created")
