list = ['The Queen\'s Gambit',
        'Call',
        'Seaspiracy',
        'Haikyu!',
        'Great Pretender']

def daftar():
    print('\033[91mWatchlist : \033[00m')
    for i in range(len(list)):
        print(list[i])

def tambah():
    a = input('Mau nambahin film apa? : ')
    list.append(a)
    daftar()
    print('Yang ditambah : ', [a])

def hapus():
    b = input('Udah nonton yang mana? : ')
    list.remove(b)
    daftar()
    print('Yang dihapus : ', [b])

def update():
    c = str(input('Masukkan judul film yang mau diganti : '))
    d = str(input('Film pengganti : '))
    for item in range(0, len(list)):
        if c in list[item]:
            list[item] = d
    daftar()
    print([c], 'diganti jadi', [d])

def pilihin():
    import random
    f = random.choice(list)
    print('Pilihan film buat kamu : ', f)

def kosongin():
    list.clear()
    daftar()
    print('Watchlist kamu kosong!')

def selectionsort(array, size):  #Ascending
    for step in range(size):
        min_idx = step
        for i in range(step+1, size):
            if array[i] < array[min_idx]:
                min_idx = i
        (array[step], array[min_idx]) = (array[min_idx], array[step])
    return

def bubblesort(array): #Descending
    for i in range(len(array)):
        for j in range(0, len(array)-i-1):
            if array[j] < array[j+1]:
                (array[j], array[j+1]) = (array[j+1], array[j])
    return

def linearsearch(array, n, x):
    for i in range(0, n):
        if (array[i] == x):
            return i
    return -1

def tanya():
    ask = input('Pilihan menu : ')
    if ask == '1':
        daftar()
    elif ask == '2':
        tambah()
    elif ask == '3':
        hapus()
    elif ask == '4':
        pilihin()
    elif ask == '5':
        kosongin()
    elif ask == '6':
        update()
    elif ask == '7':
        sort = {
            1:'Ascending (A-Z)',
            2:'Descending (Z-A)'
        }
        for key, value in sort.items():
            print(key,'-', value)
        ask1 = input('Urutkan secara : : ')
        if ask1 == '1':
            size = len(list)
            selectionsort(list, size)
            daftar()
        elif ask1 == '2' :
            bubblesort(list)
            daftar()
        else:
            print('Pilihan lain belum tersedia')
    elif ask == '8':
        x = input('Masukkan judul film yang ingin dicari : ')
        n = len(list)
        cari = linearsearch(list, n, x)
        if cari == -1:
            print('Film tidak ada di list')
        else:
            print('Film ada di indeks ke-',cari)
    else:
        print('Pilihan lain belum tersedia')

while True:
    print('.'*20)
    print('Daftar Menu')
    dm = {
        1:'Lihat Watchlist',
        2:'Tambah Film ke Watchlist',
        3:'Hapus Film dari Watchlist',
        4:'Pilih Film Random',
        5:'Hapus Watchlist',
        6:'Update Film di Watchlist',
        7:'Urutkan Judul Film',
        8:'Cari Judul Film'
    }
    for key,value in dm.items():
        print(key,'-',value)
    print('.'*20)
    tanya()
    ulang = input('Mau gunakan menu lain? (y/t) : ')
    if ulang == 'y':
        continue
    elif ulang == 't':
        print('Bye Bye!')
        break
    else:
        print('Wah pilihannya gaada')