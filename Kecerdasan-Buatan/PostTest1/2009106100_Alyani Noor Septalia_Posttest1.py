while True:
    nama = input('\nNama : ')
    sistolik = float(input('Sistolik : '))
    diastolik = float(input('Diastolik : '))
    umur = int(input('Usia (dalam tahun): '))
    
    if 1 <= umur <= 18:
        if sistolik < 80 or diastolik < 55:
            print('Tekanan darah '+nama+' rendah')
        elif 80 <= sistolik <= 120 or 55 <= diastolik <= 80:
            print('Tekanan darah '+nama+' optimal')
        elif 120 < sistolik <= 129 or diastolik < 80:
            print('Tekanan darah '+nama+' tinggi')
        elif 130 <= sistolik <= 139 or 80 <= diastolik < 89: 
            print(nama+' mengalami hipertensi tingkat 1 (ringan)')
        elif sistolik >= 140 or diastolik >= 90:
            print(nama+' mengalami hipertensi tingkat 2 (sedang)')
    elif 19 <= umur <= 59:
        if sistolik < 90 or diastolik < 60:
            print('Tekanan darah '+nama+' rendah')
        elif 90 < sistolik <= 120 or 60 <= diastolik <= 80:
            print('Tekanan darah '+nama+' normal')
        elif 120 <= sistolik <= 140 or 90 <= diastolik <= 100: 
            print(nama+' mengalami hipertensi tingkat 1 (ringan)')
        elif sistolik >= 160 or diastolik >= 100:
            print(nama+' mengalami hipertensi tingkat 2 (sedang)')
    elif umur >= 60:
        if sistolik < 90 or diastolik < 60:
            print('Tekanan darah '+nama+' rendah')
        elif 90 <= sistolik <= 120 or 60 <= diastolik <= 90:
            print('Tekanan darah '+nama+' normal')
        elif sistolik >= 140 or diastolik >= 90:
            print(nama+' mengalami hipertensi')
    else:
        print('Nilai diluar ambang batas')