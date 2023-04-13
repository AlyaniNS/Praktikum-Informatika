import pandas as pd
import csv


# In[31]:


df = pd.read_csv('daftartensi.csv')
df


# In[30]:


noid = int(input('ID yang akan diganti: ')) - 1 
nama = input('Nama : ')
sistolik = int(input('Sistolik : '))
diastolik = int(input('Diastolik : '))
umur = int(input('Umur : '))

if 1 <= umur <= 18: 
    if sistolik < 80 or diastolik < 55: 
        a = 'Rendah'
    elif 80 <= sistolik <= 120 or 55 <= diastolik <= 80: 
        a = 'Optimal' 
    elif 120 < sistolik <= 129 or diastolik < 80: 
        a = 'Tinggi'
    elif 130 <= sistolik <= 139 or 80 <= diastolik < 89: 
        a = 'Hipertensi Tk.1' 
    elif sistolik >= 140 or diastolik >= 90: 
        a = 'Hipertensi Tk.2'
elif 19 <= umur <= 59: 
    if sistolik < 90 or diastolik < 60: 
        a = 'Rendah' 
    elif 90 < sistolik <= 120 or 60 <= diastolik <= 80: 
        a = 'Normal'
    elif 120 <= sistolik <= 140 or 90 <= diastolik <= 100: 
        a = 'Hipertensi Tk.1' 
    elif sistolik >= 160 or diastolik >= 100: 
        a = 'Hipertensi Tk.2' 
elif umur >= 60: 
    if sistolik < 90 or diastolik < 60: 
        a = 'Rendah'
    elif 90 <= sistolik <= 120 or 60 <= diastolik <= 90: 
        a = 'Normal'
    elif sistolik >= 140 or diastolik >= 90: 
        a = 'Hipertensi' 
else: 
    print('Nilai diluar ambang batas')

df.loc[noid,['Nama','Sistolik','Diastolik','Umur','Kategori']] = [nama, sistolik, diastolik, umur, a]
df.to_csv('daftartensi.csv', index=False)

df





