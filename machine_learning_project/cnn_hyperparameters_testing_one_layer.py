# Imports
import pandas as pd
import numpy as np
from numpy import array
from numpy import argmax
from Bio import SeqIO
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import OneHotEncoder
import tensorflow
from keras.preprocessing.sequence import pad_sequences
from warnings import simplefilter
import os

# import sys
# np.set_printoptions(threshold=sys.maxsize)

"""# Funções"""

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

def ohe_fun(coluna):
  integer_encoder = LabelEncoder()  
  one_hot_encoder = OneHotEncoder(categories='auto')   
  input_features = []

  for linha in coluna[coluna.columns[1]]:
    integer_encoded = integer_encoder.fit_transform(list(linha))
    integer_encoded = np.array(integer_encoded).reshape(-1, 1)
    one_hot_encoded = one_hot_encoder.fit_transform(integer_encoded)
    input_features.append(one_hot_encoded.toarray())
  input_features=pad_sequences(input_features, padding='post')
  input_features = np.stack(input_features)
  return(input_features)

def flatten_sequence(pred_fasta_flat):
  dimensoes=pred_fasta_flat.shape
  n_samples=dimensoes[0]
  n_x=dimensoes[1]
  n_y=dimensoes[2]
  n_xy=(n_x * n_y)
  pred_fasta_flat=pred_fasta_flat.reshape(n_samples,n_xy)
  return(pred_fasta_flat)

"""# Pré-processamento"""

# te_frame = fasta_frame('/content/drive/My Drive/fastas/db_te_training_set.fasta','TE')
# rd_frame = fasta_frame('/content/drive/My Drive/fastas/danio_rerio_ncrna.fasta','RD')
# s_f = [rd_frame,te_frame]
# seq_df = pd.concat(s_f,ignore_index=True)
# pd.set_option('display.max_rows', len(seq_df))
# seq_df.sample(10)

"""# Import from csv"""
seq_df = pd.read_csv('ml_df_train_set_00.csv')

x_sequence_arrays = ohe_fun(seq_df)
x_flat_2d = flatten_sequence(x_sequence_arrays)
# x_flat_2d

y_str=seq_df['label']


"""# Deep Neural Networs"""

from sklearn import preprocessing
from numpy import array
from numpy import argmax
from keras.utils import to_categorical

lbenc = preprocessing.LabelBinarizer()
ynn = lbenc.fit_transform(y_str)
encoded = to_categorical(ynn)

# Train and test splits

from sklearn.model_selection import train_test_split


x_train, x_test, ynn_train, ynn_test = train_test_split(x_flat_2d, 
                                                    encoded,
                                                    test_size = 0.20, 
                                                    random_state=42,
                                                    stratify=y_str)


x_train_3d = np.expand_dims(x_train, axis=2)
# x_train_3d.shape

x_test_3d = np.expand_dims(x_test, axis=2)
# x_test_3d.shape

"""### Hyperparameter testing"""

from tensorflow.keras.layers import Conv1D, Dense, MaxPooling1D, Flatten
from tensorflow.keras.models import Sequential
from sklearn.model_selection import GridSearchCV
from keras.wrappers.scikit_learn import KerasClassifier

import talos as ta
p = {'lr': (0.5, 5, 10),
     'first_neuron':[16, 24, 32],
     'batch_size':[10,25,50,75],
     'epochs': [7,8,11,15],
     'optimizer': ['SGD', 'Adam', 'Nadam'],
     'losses': ['logcosh','categorical_crossentropy'],
     'activation':['sigmoid','relu', 'elu'],
     'last_activation': ['softmax','sigmoid']}


def te_hype(x_train, y_train, x_val, y_val, params):
    model = Sequential()

    model.add(Conv1D(filters=params['first_neuron'], kernel_size=12, 
                    input_shape=(x_train.shape[1], 1)))
    
    model.add(Flatten())

    model.add(Dense(16, params['activation']))
    model.add(Dense(2, activation=params['last_activation']))

    model.compile(loss=params['losses'],
                  # here we add a regulizer normalization function from Talos
                  optimizer=params['optimizer'],
                  metrics=['acc'])
    # model.summary()

    history = model.fit(x_train_3d, ynn_train, 
                      epochs=params['epochs'],
                      batch_size=params['batch_size'],
                      verbose=1,
                      validation_split=0.0,
                      validation_data=(x_test_3d,ynn_test))
    
    return history, model

teste = ta.Scan(x=x_train_3d,
            y=ynn,
            model=te_hype,
            fraction_limit=0.01, 
            params=p,
            experiment_name='te_identification')