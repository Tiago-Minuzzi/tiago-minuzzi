#!/usr/bin/env python
# coding: utf-8

# In[10]:


import pandas as pd
import seaborn as sns


# In[11]:


genome_size=2300000000


# In[19]:


df = pd.read_csv('tes_sten.kimura.txt',sep=' ')


# In[20]:


df.drop('Unnamed: 56',axis=1, inplace=True)


# In[21]:


melted = df.melt(id_vars='Div')


# In[22]:


#melted=melted.loc[(melted['variable']!='rRNA') & (melted['variable']!='tRNA') & (melted['variable']!='Transposable')]


# In[23]:


melted['norm']=(melted['value']-melted['value'].mean())/melted['value'].std()
#melted['norm']=(melted['value']/genome_size)*100


# In[24]:


melted.head()


# In[25]:


sns.displot(melted,x='norm',hue='variable',log_scale=True,multiple='stack',)

