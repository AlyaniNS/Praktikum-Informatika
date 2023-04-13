# Program pembelian komputer
user_id = 0
user =  [
            {
                'id':'1234',
                'username':'user',
                'saldo':0
            },
            {
                'id':'4321',
                'username':'admin',
            }
        ]
login = False
runprogram = 'y'

def cek_login(p):
    for us in user:
        if us['username'] == p:
            return us
    return False

def cek_user(id):
    for i in range(len(user)):
        if user[i]['id'] == str(id):
            return int(i)
    return -1

def topup(uang):
    index1 = cek_user(user_id)
    if index1 <= 0:
        if user[index1]['saldo'] <= int(uang):
            user[index1]['saldo'] = user[index1]['saldo'] + int(uang)
            print('+'*33)
            print('Kamu berhasil topup ' + str(uang))
            print('Saldo kamu',user[index1]['saldo'])
            print('+'*33)
        else:
            print('Masukkan input yang benar')

def bayar(uang):
    index1 = cek_user(user_id)
    if index1 >= 0:
        if user[index1]['saldo'] >= int(uang):
            user[index1]['saldo'] =user[index1]['saldo'] - int(uang)
            print('Pembayaran senilai '+str(uang)+' berhasil')
            print('Saldo kamu',user[index1]['saldo'])
            print('+'*50)
            faktur()
        else:
            print('Ups, saldo kamu tidak cukup')

def faktur():
    print('='*35)
    print('== FAKTUR PEMBELIAN BLA COMPUTER ==')
    print('='*35)
    print('Nama barang: ',beli)
    print('Harga: ',harga)
    print('-'*35)
    print('\t\t\tLUNAS')
    print('-'*35)
    print('** Terima Kasih Sudah Berbelanja **')
    print('='*35)

harga_barang = {
    'ultrabook':8000000,
    'gaming':23500000,
    'workstation':48000000,
    '2 in 1':12000000
    }

while runprogram == 'y':
    while login == False:
        print('-'*34)
        print('| Selamat datang di Bla Computer |')
        print('-'*34)
        print('Silahkan masukan username kamu')
        un = input('Masukan username : ')
        print('-'*33)

        cl = cek_login(un)
        if cl != False:
            print('\nHai '+cl['username'])
            user_id = cl['id']
            login = True
            loop = 'y'
        else:
            print('')
            print('Akun tidak terdaftar')
            print('')


    while un == 'user':
        u = user[cek_user(user_id)]
        print('+'*20)
        print('| Daftar menu: \t   |')
        print('| 1.Cek Saldo\t   |')
        print('| 2.Topup Saldo\t   |')
        print('| 3.Daftar barang  |')
        print('| 4.Beli barang\t   |')
        print('| 5.Logout\t\t   |')
        print('| 6.Keluar Program |')
        print('+'*20)
        print('!Gunakan angka saja!')
        menuuser = int(input('Silahkan pilih menu: '))
        if menuuser == 1:
            print('+'*20)
            print('Saldo kamu',u['saldo'])
            print('+'*20)
            loop = 'n'
        elif menuuser == 2:
            print('+'*50)
            t = int(input('Masukkan nominal yang ingin di topup: '))
            topup(t)
            loop = 'n'
        elif menuuser == 3:
            print('+'*25)
            for key, value in harga_barang.items():
                print(key, ':', value)
                loop = 'n'
            print('+'*25)
        elif menuuser == 4:
            print('+'*50)
            beli = input('Masukkan nama barang yang ingin dibeli: ')
            harga = harga_barang[beli]
            print('Anda ingin membeli',beli,'dengan harga',harga)
            konfirmasi = input('Apakah pesanan anda sudah benar? (y/t): ')
            print('+'*50)
            if konfirmasi == 'y':
                bayar(harga)
            elif konfirmasi == 't':
                loop = 'n'
            else:
                print('Masukkan input yang benar')
                loop = 'n'
        elif menuuser == 5:
            print('|'*34)
            print('| Anda telah logout sebagai user |')
            print('|'*34)
            login = False
            break
        elif menuuser == 6:
            login = False
            loop = 'n'
            runprogram = 'n'
            print('Terimakasih telah menggunakan program ini sebagai user')
            print('''Kami mohon maaf jika masih banyak kekurangan karena program ini masih dalam tahap pengembangan''')
            break
        else:
            print('Menu tidak tersedia')
        if login == True:
                input('kembali ke menu (Enter) ')
                print('')
                loop = 'y'

    while un == 'admin':
        print('^'*27)
        print('| \t    Daftar Menu:\t  |')
        print('| 1. Tampilkan semua data |')
        print('| 2. Buat data baru  \t  |')
        print('| 3. Update harga barang  |')
        print('| 4. Hapus barang \t\t  |')
        print('| 5. Logout \t\t\t  |')
        print('| 6. Keluar program \t  |')
        print('v'*27)
        print('!Gunakan angka saja!')
        menuadmin = int(input('Silahkan pilih menu: '))
        if menuadmin == 1:
            # Read
            print('^'*25)
            for key, value in harga_barang.items():
                print(key, ':', value)
                loop = 'n'
            print('v'*25)
        elif menuadmin == 2:
            # Create
            print('-'*25)
            b = input('Masukkan nama barang: ')
            c = int(input('Masukkan harga barang: '))
            harga_barang[b] = c
            print('^'*25)
            for key, value in harga_barang.items():
                print(key, ':', value)
                loop = 'n'
            print('v'*25)
        elif menuadmin == 3:
            # Update
            print('-'*25)
            d = input('Masukkan nama barang: ')
            e = int(input('Masukkan harga terbaru: '))
            harga_barang[d] = e
            print('^'*25)
            for key, value in harga_barang.items():
                print(key, ':', value)
                loop = 'n'
            print('v'*25)
        elif menuadmin == 4:
            # Delete
            print('-'*25)
            f = input('Masukkan nama barang yang ingin dihapus: ')
            del harga_barang[f]
            print('^'*25)
            for key, value in harga_barang.items():
                print(key, ':', value)
                loop = 'n'
            print('v'*25)
        elif menuadmin == 5:
            print('/'*35)
            print('/ Anda telah logout sebagai admin /')
            print('/'*35)
            login = False
            break
        elif menuadmin == 6:
            login = False
            loop = 'n'
            runprogram = 'n'
            print('Terimakasih telah menggunakan program ini sebagai admin')
            print('''Kami mohon maaf jika masih banyak kekurangan karena program ini masih dalam tahap pengembangan''')
            break
        else:
            print('Menu tidak tersedia')
        if login == True:
            input('kembali ke menu (Enter)')
            print('')
            loop = 'y'
