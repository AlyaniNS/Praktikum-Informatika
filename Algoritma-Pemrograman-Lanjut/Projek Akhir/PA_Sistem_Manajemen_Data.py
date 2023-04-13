import csv
import pandas as pd
from datetime import date
import calendar
import datetime
import time
from tabulate import tabulate
import os

# Data
user = ("User")
password = ("01")


def cls():
    os.system("cls" if os.name == "nt" else "clear")

def linearSearch(arr, d, b, x):
    tampung = []
    if b < d:
        return -1
    if x in arr[d]:
        return d
    if x in arr[b]:
        return b
    return linearSearch(arr, d+1, b-1, x)


# MENU PAK RT
def tampil_menu():
    cls()
    print(" ==================================================================")
    print(" ==================================================================")
    print("|                                                                  |")
    print("|                     Selamat Bertugas Pak RT                      |")
    print("|                                                                  |")
    print("|                  1. Data Warga                                   |")
    print("|                  2. Aspirasi Warga                               |")
    print("|                  3. Jadwal Kegiatan Bersama                      |")
    print("|                  4. Kembali ke login                             |")
    print("|__________________________________________________________________|")
    print("|__________________________________________________________________|")
    pilih = input("\t\t\t\t\t   Silahkan Pilih Menu : ")
    if pilih == "1":
        menu_warga()
    elif pilih == "2":
        menu_aspirasi()
    elif pilih == "3":
        menu_kegiatan()
    elif pilih == "4":
        menu_login()
    else:
        print("Pilihan Tidak Tersedia")
        time.sleep(1.5)
        tampil_menu()


# CRUD DATA WARGA
def menu_warga():
    cls()
    read_warga()
    print("")
    print(" ===============================================================================================")
    print("                 Diatas adalah data valid warga pada komplek yang anda urus!")
    print(" ===============================================================================================")
    print("|                                        Menu :                                                 |")
    print("|                             1. Penambahan warga baru                                          |")
    print("|                             2. Penghapusan  data  warga                                       |")
    print("|                             3. Mengubah data warga                                            |")
    print("|                             4. Kembali                                                        |")
    print("")
    pilih = input("\t\t\t\t\t   Silahkan Pilih Menu : ")
    if pilih == "1":
        create_warga()
    elif pilih == "2":
        delete_warga()
    elif pilih == "3":
        update_warga()
    elif pilih == "4":
        tampil_menu()
    else:
        print("Pilihan Tidak Tersedia")
        time.sleep(1.5)
        menu_warga()


def read_warga():
    tampil = open("datakk.csv", 'r', newline='')
    read_datakk = csv.reader(tampil)
    tampilkan = list(read_datakk)
    print(tabulate(tampilkan, headers='firstrow', tablefmt='fancy_grid', showindex=True))


def delete_warga():
    cls()
    tampil = pd.read_csv("datakk.csv")
    read_warga()
    pilih = int(input("Pilih Indeks yang ingin dihapus : "))
    df = tampil.drop(pilih)
    df.to_csv("datakk.csv", index=False)
    print("Data Berhasil Dihapus")
    time.sleep(2)
    menu_warga()


def update_warga():
    cls()
    tampil = pd.read_csv("datakk.csv")
    read_warga()
    pilih = int(input("Pilih Indeks data warga yang ingin diubah : "))
    print("\t\t\t\tUPDATE DATA : ")
    print("\t\t\tMasukkan data warga baru : ")
    while True:
        try:
            a = input('Masukkan NIK : ')
            nik = int(a)
            if len(a) != 16:
                raise ValueError
            else:
                print('NIK : ', nik)
                break
        except ValueError:
            print('NIK harus terdiri dari 16 digit angka!')
    while True:
        try:
            nama = input('Masukkan Nama : ')
            if all(a.isalpha() or a.isspace() for a in nama):
                print('Nama : ', nama)
                break
            else:
                raise ValueError
        except ValueError:
            print('Nama tidak boleh mengandung angka dan karakter!')
    while True:
        a = input('Tahun (YYYY): ')
        b = input('Bulan (MM): ')
        c = input('Tanggal (DD): ')
        try:
            conva = int(a)
            convb = int(b)
            convc = int(c)
            tanggal = datetime.date(conva, convb, convc)
            cekkabisat = calendar.isleap(tanggal.year)
            if a.isdigit() and b.isdigit() and c.isdigit():
                if cekkabisat == False:
                    formattanggal = date(conva, convb, convc).isoformat()
                    print('Tanggal Lahir : ', formattanggal)
                    break
            else:
                raise ValueError
        except ValueError:
            print('Tanggal Tidak Ditemukan')
    while True:
        try:
            tempat_lahir = input('Masukkan Tempat Lahir : ')
            if all(a.isalpha() or a.isspace() for a in tempat_lahir):
                print('Tempat Lahir : ', tempat_lahir)
                break
            else:
                raise ValueError
        except ValueError:
            print('Nama tidak boleh mengandung angka dan karakter!')
    while True:
        try:
            agama = input('Masukkan Agama : ')
            if all(a.isalpha() or a.isspace() for a in agama):
                print('Agama : ', agama)
                break
            else:
                raise ValueError
        except ValueError:
            print('Nama tidak boleh mengandung angka dan karakter!')
    tampil.loc[pilih, 'NIK'] = nik
    tampil.loc[pilih, 'Nama'] = nama
    tampil.loc[pilih, 'Tanggal Lahir'] = formattanggal
    tampil.loc[pilih, 'Tempat Lahir'] = tempat_lahir
    tampil.loc[pilih, 'Agama'] = agama
    tampil.to_csv("datakk.csv", index=False)    
    cls()
    print("Data Sudah Diupdate!!!")
    time.sleep(2)
    menu_warga()


def create_warga():
    cls()
    list_tampil = []
    open_append = open('datakk.csv', 'a', newline='')
    w = csv.writer(open_append)
    banyak_orang = int(input("Berapa banyak orang yang ingin ditambah : "))
    while banyak_orang > 0:
        print("\t\tMasukkan data warga baru : ")
        while True:
            try:
                a = input('Masukkan NIK : ')
                nik = int(a)
                if len(a) != 16:
                    raise ValueError
                else:
                    print('NIK : ', nik)
                    break
            except ValueError:
                print('NIK harus terdiri dari 16 digit angka!')
        while True:
            try:
                nama = input('Masukkan Nama : ')
                if all(a.isalpha() or a.isspace() for a in nama):
                    print('Nama : ', nama)
                    break
                else:
                    raise ValueError
            except ValueError:
                print('Nama tidak boleh mengandung angka dan karakter!')
        while True:
            a = input('Tahun (YYYY): ')
            b = input('Bulan (MM): ')
            c = input('Tanggal (DD): ')
            try:
                conva = int(a)
                convb = int(b)
                convc = int(c)
                tanggal = datetime.date(conva, convb, convc)
                cekkabisat = calendar.isleap(tanggal.year)
                if a.isdigit() and b.isdigit() and c.isdigit():
                    if cekkabisat == False:
                        formattanggal = date(conva, convb, convc).isoformat()
                        print('Tanggal Lahir : ', formattanggal)
                        break
                else:
                    raise ValueError
            except ValueError:
                print('Tanggal Tidak Ditemukan')
        while True:
            try:
                tempat_lahir = input('Masukkan Tempat Lahir : ')
                if all(a.isalpha() or a.isspace() for a in tempat_lahir):
                    print('Tempat Lahir : ', tempat_lahir)
                    break
                else:
                    raise ValueError
            except ValueError:
                print('Nama tidak boleh mengandung angka dan karakter!')
        while True:
            try:
                agama = input('Masukkan Agama : ')
                if all(a.isalpha() or a.isspace() for a in agama):
                    print('Agama : ', agama)
                    break
                else:
                    raise ValueError
            except ValueError:
                print('Nama tidak boleh mengandung angka dan karakter!')
        list_tampil.append([nik, nama, formattanggal, tempat_lahir, agama])
        w.writerow([nik, nama, formattanggal, tempat_lahir, agama])
        time.sleep(1.5)
        banyak_orang -= 1
    cls()
    print("\t\tBerikut adalah data yang anda masukkan :")
    print(tabulate(list_tampil, headers=["NIK", "Nama", "Tanggal Lahir", "Tempat Lahir", "Agama"], tablefmt='fancy_grid'))
    input("\t\tTekan enter untuk melanjutkan..")
    cls()
    open_append.close()
    menu_warga()

# CRUD Data Aspirasi
def menu_aspirasi():
    cls()
    print(" ===================================================================")
    print(" ===================================================================")
    print("|                             Menu :                                |")
    print("|                   1. Liat Data Aspirasi Warga                     |")
    print("|                   2. Penghapusan  Data Aspirasi Warga             |")
    print("|                   3. Kembali                                      |")
    print("")
    pilih = input("\t\t\t\t\t   Silahkan Pilih Menu : ")
    if pilih == "1":
        tampilkan_aspirasi()
    elif pilih == "2":
        delete_aspirasi()
    elif pilih == "3":
        tampil_menu()
    else:
        print("Pilihan Tidak Tersedia")
        time.sleep(1.5)
        menu_aspirasi()


def tampilkan_aspirasi():
    tampil = open("dataaspirasi.csv", 'r', newline='')
    read_dataaspirasi = csv.reader(tampil)
    tampilkan = list(read_dataaspirasi)
    print(tabulate(tampilkan, headers='firstrow', tablefmt='fancy_grid', showindex=True))
    input("Tekan enter untuk melanjutkan..")
    menu_aspirasi()


def list_aspirasi():
    tampil = open("dataaspirasi.csv", 'r', newline='')
    read_dataaspirasi = csv.reader(tampil)
    tampilkan = list(read_dataaspirasi)
    print(tabulate(tampilkan, headers='firstrow', tablefmt='fancy_grid', showindex=True))


def delete_aspirasi():
    cls()
    tampil = pd.read_csv("dataaspirasi.csv")
    list_aspirasi()
    pilih = int(input("Pilih Indeks yang ingin dihapus : "))
    df = tampil.drop(pilih)
    df.to_csv("dataaspirasi.csv", index=False)
    print("Data Berhasil Dihapus")
    menu_aspirasi()


# CRUD Kegiatan Warga
def menu_kegiatan():
    cls()
    print(" ===================================================================")
    read_kegiatan()
    print(" ===================================================================")
    print("        Diatas adalah data kegiatan yang akan terjadi di RT !")
    print(" ===================================================================")
    print("|                            Menu :                                 |")
    print("|                  1. Penambahan kegiatan baru                      |")
    print("|                  2. Penghapusan  kegiatan                         |")
    print("|                  3. Mengubah data kegiatan                        |")
    print("|                  4. Kembali                                       |")
    print("")
    pilih = input("\t\t\t\t\t   Silahkan Pilih Menu : ")
    if pilih == "1":
        create_kegiatan()
    elif pilih == "2":
        delete_kegiatan()
    elif pilih == "3":
        update_kegiatan()
    elif pilih == "4":
        tampil_menu()
    else:
        print("Pilihan Tidak Tersedia")
        time.sleep(1.5)
        menu_kegiatan()


def read_kegiatan():
    tampil = open("datakegiatan.csv", 'r', newline='')
    read_datakk = csv.reader(tampil)
    tampilkan = list(read_datakk)
    print(tabulate(tampilkan, headers='firstrow', tablefmt='fancy_grid', showindex=True))


def delete_kegiatan():
    cls()
    tampil = pd.read_csv("datakegiatan.csv")
    read_kegiatan()
    pilih = int(input("Pilih Indeks yang ingin dihapus : "))
    df = tampil.drop(pilih)
    df.to_csv("datakegiatan.csv", index=False)
    print("Data Berhasil Dihapus")
    time.sleep(2)
    menu_kegiatan()


def update_kegiatan():
    cls()
    tampil = pd.read_csv("datakegiatan.csv")
    read_kegiatan()
    pilih = int(input("Pilih Indeks data kegiatan yang ingin diubah : "))
    conv_pilih = bool(pilih)
    if pilih == True:
        tampil.loc[pilih, 'Tanggal']
        print("\t\tUPDATE DATA : ")
        while True:
            a = input('Tahun (YYYY): ')
            b = input('Bulan (MM): ')
            c = input('Tanggal (DD): ')
            try:
                conva = int(a)
                convb = int(b)
                convc = int(c)
                tanggal = datetime.date(conva, convb, convc)
                cekkabisat = calendar.isleap(tanggal.year)
                if a.isdigit() and b.isdigit() and c.isdigit():
                    if cekkabisat == False:
                        formattanggal = date(conva, convb, convc).isoformat()
                        print('Tanggal Lahir : ', formattanggal)
                        break
                else:
                    raise ValueError
            except ValueError:
                print('Tanggal Tidak Ditemukan')
        while True:
            try:
                print("Masukkan Nama Kegiatan")
                nama = input('Nama Kegiatan : ')
                if all(a.isalpha() or a.isspace() for a in nama):
                    print("-"*20)
                    break
                else:
                    raise ValueError
            except ValueError:
                print('Nama tidak boleh mengandung angka dan karakter!')
        print("Masukkan Jam Kegiatan")
        waktu = str(input("Jam Kegiatan : "))
        print("-"*20)
        tampil.loc[pilih, 'Tanggal'] = formattanggal
        tampil.loc[pilih, 'Nama Kegiatan'] = nama
        tampil.loc[pilih, 'Waktu'] = waktu
        tampil.to_csv("datakegiatan.csv", index=False)
        cls()
        print("Data Sudah Diupdate!!!")
        time.sleep(2)
        menu_kegiatan()
    else:
        print("\n      Index yang anda input tidak tersedia !!!")
        print("----------------------------------------------------")
        print("              < Kembali: Tekan Enter >              ")
        input("                            ")
        time.sleep(2)
        update_warga()


def create_kegiatan():
    cls()
    data = []
    print("")
    print("===================================================================")
    read_kegiatan()
    print("===================================================================")
    while True:
        a = input('Tahun (YYYY): ')
        b = input('Bulan (MM): ')
        c = input('Tanggal (DD): ')
        try:
            conva = int(a)
            convb = int(b)
            convc = int(c)
            tanggal = datetime.date(conva, convb, convc)
            cekkabisat = calendar.isleap(tanggal.year)
            if a.isdigit() and b.isdigit() and c.isdigit():
                if cekkabisat == False:
                    formattanggal = date(conva, convb, convc).isoformat()
                    print('Tanggal Lahir : ', formattanggal)
                    break
            else:
                raise ValueError
        except ValueError:
            print('Tanggal Tidak Ditemukan')
    while True:
        try:
            print("Masukkan Nama Kegiatan")
            nama = input('Nama Kegiatan : ')
            if all(a.isalpha() or a.isspace() for a in nama):
                print("-"*20)
                break
            else:
                raise ValueError
        except ValueError:
            print('Nama tidak boleh mengandung angka dan karakter!')
    print("Masukkan Jam Kegiatan")
    waktu = str(input("Jam Kegiatan : "))
    print("-"*20)
    data.append(formattanggal)
    data.append(nama)
    data.append(waktu)
    d = open('datakegiatan.csv', 'a', newline='')
    w = csv.writer(d)
    w.writerow(data)
    d.close()
    print("Data Sudah Ditambah!!!")
    print("")
    time.sleep(2)
    cls()
    data.clear()
    menu_kegiatan()


# Menu Login
def menu_login():
    cls()
    print(" ==================================================================")
    print(" ==================================================================")
    print("|                                                                 |")
    print("|                     Selamat Datang !!!                          |")
    print("|                                                                 |")
    print("|                        1. Pak RT                                |")
    print("|                        2. Warga                                 |")
    print("|                        3. Keluar                                |")
    print("|_________________________________________________________________|")
    print("")
    pilih = input("\t\t\t\t\t   Silahkan Pilih Menu : ")
    if pilih == "1":
        login = input("\t\t\t\t\t   Silahkan Masukkan Username : ")
        pw = input("\t\t\t\t\t   Silahkan Masukkan Password : ")
        if (login == user and pw == password):
            tampil_menu()
        else:
            print("Username atau Password Salah")
            menu_login()
    elif pilih == "2":
        tampil_warga()
    elif pilih == "3":
        print("\t\tTerima kasih telah mengguakan program ini!!")
    else:
        print("Pilihan Tidak Tersedia")
        time.sleep(1.5)
        menu_login()


# Menu Warga
def enter():
    input("Tekan Enter Untuk Kembali")
    print("\n")
    tampil_warga()


# Menu Warga
def tampil_warga():
    print(" ==================================================================")
    print("|                                                                 |")
    print("|                         Welcome !!!                             |")
    print("|                                                                 |")
    print("|                  1. Liat Data Warga                             |")
    print("|                  2. Liat Kegiatan RT                            |")
    print("|                  3. Aspirasi Warga                              |")
    print("|                  4. Kembali ke login                            |")
    print("|_________________________________________________________________|")
    print("")
    pilih = input("\t\t\t\t\t   Silahkan Pilih Menu : ")
    if pilih == "1":
        read_warga()
        enter()
    elif pilih == "2":
        read_kegiatan()
        enter()
    elif pilih == "3":
        beri_aspirasi()
        enter()
    elif pilih == "4":
        menu_login()
    else:
        print("\n")
        print("Pilihan Tidak Valid")
        print("\n")
        tampil_warga()


def read_warga_warga():
    df = open("datakk.csv", newline='')
    csv_read = csv.reader(df)
    csv_list = list(csv_read)
    print(tabulate(csv_list, headers='', tablefmt='fancy_grid'))


def read_kegiatan_warga():
    df = open("datakegiatan.csv", newline='')
    csv_read = csv.reader(df)
    csv_list = list(csv_read)
    print(tabulate(csv_list, headers='firstrow', tablefmt='fancy_grid'))


def beri_aspirasi():
    print("")
    print("===================================================================")
    print("                          Aspirasi Warga                           ")
    print("===================================================================")
    while True:
        try:
            a = input('Masukkan NIK : ')
            nik = int(a)
            if len(a) != 16:
                raise ValueError
            else:
                print('NIK : ', nik)
                break
        except ValueError:
            print('NIK harus terdiri dari 16 digit angka!')
    open_read = open('datakk.csv', 'r')
    r = csv.reader(open_read)
    list_read = list(r)
    n = len(list_read)
    x = a
    index = linearSearch(list_read, 0, n - 1, x)
    if index != -1:
        print(f"NIK {x} ditemukan pada Database")
    else:
        print(f"NIK {x} tidak ditemukan.")
    aspirasi = input("Silahkan Berikan Aspirasi Anda : ")
    data_append = open('dataaspirasi.csv', 'a', newline='')
    w = csv.writer(data_append)
    w.writerow([a,list_read[index][1],aspirasi])
    data_append.close()
    tampil_warga()

menu_login()