import datetime
from datetime import date
import calendar

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