#Percabangan

print('-'*34)
print('| \t\t\t Takoyaki \t\t\t |')
print('| \t\t\t\t\t\t\t\t |')
print('| 1. Gurita: Rp2000/pcs \t\t |')
print('| 2. Keju: Rp2500/pcs \t\t\t |')
print('| \t\t\t\t\t\t\t\t |')
print('| \t Diskon khusus pembelian: \t |')
print('| Varian gurita >10pcs: Disc 10% |')
print('| Varian keju >8pcs: Disc 8% \t |')
print('-'*34)

stok1 = 45
stok2 = 40

a = input('Masukkan varian yang ingin dibeli (1/2) : ')
if a == '1':
    b = int(input('Ingin beli berapa pcs? : '))
    total1 = b*2000
    print('Total bayar: Rp',total1)
    if b >= 10:
        print('Kamu mendapatkan diskon sebesar 10%')
        d = b * 10/100
        e = total1 - d
        print('Total yang perlu kamu bayar sekarang: Rp',e)
        gurita = stok1 - b
        print('Sisa stok varian gurita: ',gurita)

elif a == '2':
    c = int(input('Ingin beli berapa pcs? : '))
    total2 = c*2500
    print('Total bayar: Rp',total2)
    if c >= 8:
        print('Kamu mendapatkan diskon sebesar 8%')
        f = c * 8/100
        g = total2 - f
        print('Total yang perlu kamu bayar sekarang: Rp',g)
        keju = stok2 - c
        print('Sisa stok varian keju: ',keju)
else:
    print('Maaf varian lain belum tersedia')