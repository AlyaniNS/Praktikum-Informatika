#!/usr/bin/env python
# coding: utf-8

# In[32]:


import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


# In[3]:


df = pd.read_csv('daftartensi.csv')
df


# In[145]:


#Usia 1-18
a = df.query('1 < Umur <= 18')
a


# In[44]:


#Usia 19-59
b = df.query('19 <= Umur <= 59')
b


# In[45]:


#Usia ≥60
c = df.query('Umur >= 60')
c


# In[180]:


#plot 1
labels = a['Nama']
sis = a['Sistolik']
dis = a['Diastolik']
x = np.arange(len(labels))
width = 0.35

fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, sis, width, label='Sistolik')
rects2 = ax.bar(x + width/2, dis, width, label='Diastolik')

ax.set_ylabel('Tekanan Darah')
ax.set_xlabel('Nama')
ax.set_title('Data Tekanan Darah Usia 1-18 Tahun')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.legend()

fig.tight_layout()

plt.show()


# In[181]:


#plot 2
labels = b['Nama']
sis = b['Sistolik']
dis = b['Diastolik']
x = np.arange(len(labels))
width = 0.35

fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, sis, width, label='Sistolik')
rects2 = ax.bar(x + width/2, dis, width, label='Diastolik')

ax.set_ylabel('Tekanan Darah')
ax.set_xlabel('Nama')
ax.set_title('Data Tekanan Darah Usia 19-59 Tahun')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.legend()

fig.tight_layout()

plt.show()


# In[182]:


#plot 3
labels = c['Nama']
sis = c['Sistolik']
dis = c['Diastolik']
x = np.arange(len(labels))
width = 0.35

fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, sis, width, label='Sistolik')
rects2 = ax.bar(x + width/2, dis, width, label='Diastolik')

ax.set_ylabel('Tekanan Darah')
ax.set_xlabel('Nama')
ax.set_title('Data Tekanan Darah Usia ≥ 60 Tahun')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.legend()

fig.tight_layout()

plt.show()


# In[185]:


#plot 4
labels = df['Kategori'].unique()
sizes = df['Kategori'].value_counts()

fig, ax = plt.subplots()
ax.pie(sizes, labels=labels, autopct='%1.1f%%',
        shadow=True, startangle=90)

ax.set_title('Persentase Kategori Tekanan Darah Keseluruhan')

plt.show()


# In[ ]:




