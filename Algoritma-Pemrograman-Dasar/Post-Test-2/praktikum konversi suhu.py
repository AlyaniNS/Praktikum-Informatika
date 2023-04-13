# Konversi suhu dari Celcius ke Fahrenheit, Kelvin, dan Reamur
print('-'*64)
print('| Konversi suhu dari Celcius ke Fahrenheit, Kelvin, dan Reamur |')
print('-'*64)
a = float(input('Masukkan Suhu Celcius: '))
fahrenheit = 9/5 * a + 32
kelvin = a + 273
reamur = 4/5 * a
print('Suhu Fahrenheit: ', fahrenheit)
print('Suhu Kelvin: ', kelvin)
print('Suhu Reamur: ',reamur)
print('='*64)
