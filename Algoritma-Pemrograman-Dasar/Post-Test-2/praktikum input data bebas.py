# Input data Bebas
a = input('merk lensa: ')
b = input('tipe lensa: ')
c = input('focal length: ')
d = float(input('minimum aperture: '))
e = float(input('maximum aperture: '))
f = int(input('berat: '))
g = int(input('harga: '))
h = int(input('jumlah: '))
print('-'*50)
print('''Lensa dari {} dengan tipe {} memiliki panjang fokus {}, 
dengan rentang aperture {} sampai dengan {}. 
Lensa yang memiliki berat {} gram ini di banderol dengan
harga sebesar {} rupiah untuk {} buahnya'''.format(a, b, c, d, e, f, g, h))
print('-'*50)
i = [a,b,c,d,e,f,g,h]
print(i)
