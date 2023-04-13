#Perulangan

angka = int(input('Masukkan angka : '))
x: int
for x in range(angka):
    if (10 ** x > angka):
        break
    else:
        print(angka)

print('Bilangan terkecil dari 10^x yang lebih dari',angka,'adalah: ', 10 ** x)
