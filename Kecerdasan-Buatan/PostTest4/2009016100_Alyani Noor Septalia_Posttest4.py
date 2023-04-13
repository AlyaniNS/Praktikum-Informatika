#!/usr/bin/env python
# coding: utf-8

# In[163]:


from sys import maxsize

def rute(graf, awal):
    vertex = []
    for i in range(v):
        if i != awal:
            vertex.append(i)

    rutependek = maxsize
    
    print('   Rute yang dilalui \t  Ongkos perjalanan') 
    while True:
        ongkos = 0
        k = awal
        for i in range(len(vertex)):
            ongkos += graf[k][vertex[i]]
            k = vertex[i]
        ongkos += graf[k][awal]
        rutependek = min(rutependek, ongkos)
        print(graf[k], '\t\t', ongkos)

        if not permutasi(vertex):
            break
    return rutependek

def permutasi(l):
    n = len(l)
    i = n-2
    while i >= 0 and l[i] > l[i+1]:
        i -= 1
    if i == -1:
        return False

    j = i+1
    while j < n and l[j] > l[i]:
        j += 1
    j -= 1

    l[i], l[j] = l[j], l[i]
    left = i+1
    right = n-1

    while left < right:
        l[left], l[right] = l[right], l[left]
        left += 1
        right -= 1
    return True

graf = [[0, 100, 210, 200, 100], #gudang -> gudang(0), ke toko B, ke toko C, ke toko E, ke toko D
         [100, 0, 180, 120, 80], #toko B -> ke gudang, toko B(0), ke toko C, ke toko E, ke toko D
         [210, 180, 0, 30, 125], #toko C -> ke gudang, ke toko b, toko C(0), ke toko E, ke toko D
         [200, 120, 30, 0, 175], #toko E -> ke gudang, ke toko b, ke toko C, toko E(0), ke toko D
         [100, 80, 125,175, 0]]  #toko D -> ke gudang, ke toko b, ke toko C, ke toko E, toko D(0)
v = 5
awal = 0
minimum = '\nOngkos perjalanan minimum : {}'.format(rute(graf,awal))
print(minimum)

