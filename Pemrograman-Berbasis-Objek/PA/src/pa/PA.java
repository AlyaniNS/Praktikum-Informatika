package pa;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

public class PA implements Method{
    InputStreamReader data = new InputStreamReader(System.in);
    BufferedReader input = new BufferedReader(data);

    static String zakatFitrahfile, zakatMalfile;
    static ArrayList<String> zakatFitrah;
    static ArrayList<String> zakatMal;
    static boolean dataEdit = false;

    public static void main(String[] args) throws NumberFormatException, IOException {
        zakatFitrah = new ArrayList<>();
        zakatMal = new ArrayList<>();

        zakatFitrahfile = "zakatFitrah.txt";

        zakatMalfile = "zakatMal.txt";

        while (true){
            login();
        }
    }

    static void login() throws IOException {
        String username, password;

        Scanner login = new Scanner(System.in);
        PA navigate = new PA();

        System.out.println("\n=====================================================");
        System.out.println("              Sistem Manajemen Zakat                 ");
        System.out.println("                                                     ");
        System.out.print("               Username : ");
        username = login.next().toLowerCase();
        System.out.println("                                                    ");
        System.out.print("               Password : ");
        password = login.next().toLowerCase();
        System.out.println("=====================================================");

        if (username.equals("admin") && password.equals("admin")) {
            navigate.menuAdmin();
        } else if (username.equals("muzakki") && password.equals("muzakki")) {
            navigate.menuMuzakki();

        } else {
            System.out.println("Username dan Password yang dimasukkan salah!");
            login();
        }

    }

    static void readFitrah(){ //buat masukin hasil operasi crud ke file
        try{
            File fitrah = new File(zakatFitrahfile);
            Scanner fitrahRead = new Scanner(fitrah);

            zakatFitrah.clear();
            while (fitrahRead.hasNextLine()){
                String dataFitrah = fitrahRead.nextLine();
                zakatFitrah.add(dataFitrah);
            }
        }catch (FileNotFoundException e){
            System.out.println(e);
        }
    }

    static void readMal(){ //buat masukin hasil operasi crud ke file
        try{
            File mal = new File(zakatMalfile);
            Scanner malRead = new Scanner(mal);

            zakatMal.clear();
            while (malRead.hasNextLine()){
                String dataMal = malRead.nextLine();
                zakatMal.add(dataMal);
            }
        }catch (FileNotFoundException e){
            System.out.println(e);
        }
    }

    void displayFitrah(){
        readFitrah();
        if (zakatFitrah.size() > 0) {
            System.out.println("DATA ZAKAT FITRAH");
            headerFitrah();
            int index = 0;
            for (String dataFitrah : zakatFitrah) {
                System.out.println(String.format("[%d] %s", index, dataFitrah));
                index++;

            }
        } else {
            ArrayListKosongmessage();
        }
    }

    void displayMal() {
        readMal();
        if (zakatMal.size() > 0) {
            System.out.println("DATA ZAKAT MAL");
            headerMal();
            int index = 0;
            for (String dataMal : zakatMal) {
                System.out.println(String.format("[%d] %s", index, dataMal));
                index++;
            }
        } else {
            ArrayListKosongmessage();
        }
    }

    public void ArrayListKosongmessage(){ //kalo arraylistnya kosong bakal nampilin ini
        System.out.println("ArrayList kosong..");
        Scanner enter = new Scanner(System.in);
        System.out.println("\nTEKAN ENTER UNTUK KEMBALI...");
        String kembali = enter.nextLine();
        kembali.equals("");
    }

    @Override
    public void create() throws IOException {
        String alamat, telp;
        int harga, jenis, bayar;
        System.out.println("\n");
        System.out.println("=========================");
        System.out.println("||     TAMBAH DATA     ||");
        System.out.println("||=====================||");
        System.out.println("||     Pilih Zakat     ||");
        System.out.println("||  [1] Zakat Fitrah   ||");
        System.out.println("||  [2] Zakat Mal      ||");
        System.out.println("=========================");
        System.out.print("Pilih [1-2] : ");
        int pilih = Integer.parseInt(input.readLine());
        
        try {
            if (pilih == 1){
                System.out.println("");
            System.out.print("Masukkan Nama                    : ");
            String nama = input.readLine();

            System.out.print("Masukkan Usia                    : ");
            int usia = Integer.parseInt(input.readLine());
            System.out.print("Masukkan Jumlah Anggota Keluarga : ");
            int jumlah = Integer.parseInt(input.readLine());
            System.out.print("Masukkan Jenis Kelamin (P/L)     : ");
            String jenkel = input.readLine().toUpperCase();
            System.out.print("Masukkan No. Telepon             : ");
            telp = input.readLine();
            System.out.print("Masukkan Alamat                  : ");
            alamat = input.readLine();
            System.out.print("Masukkan Harga Beras perKg       : ");
            harga = Integer.parseInt(input.readLine());

            //buat nambahin data ke file
            FileWriter writeFitrah = new FileWriter(zakatFitrahfile, true);
            writeFitrah.append(String.format("\n%s%8d%20d%10s%21s%10s%30d", nama, usia, jumlah, jenkel, telp, alamat, harga));
            writeFitrah.close();
            System.out.println("\nZakat Fitrah atas nama " + nama + " berhasil diterima");
            menuMuzakki();
            
            } else if (pilih == 2){
                System.out.println("");
                System.out.print("Masukkan Nama                    : ");
                String nama = input.readLine();
                System.out.print("Masukkan Usia                    : ");
                int usia = Integer.parseInt(input.readLine());
                System.out.print("Masukkan Jenis Kelamin (P/L)     : ");
                String jenkel = input.readLine().toUpperCase();
                jenisZakatMal();
                System.out.print("Masukkan Jenis Zakat Mal         : ");
                jenis = Integer.parseInt(input.readLine());
                System.out.print("Masukkan No. Telepon             : ");
                telp = input.readLine();
                System.out.print("Masukkan Alamat                  : ");
                alamat = input.readLine();
                System.out.print("Masukkan Jumlah Pembayaran       : ");
                bayar = Integer.parseInt(input.readLine());

                FileWriter writeMal = new FileWriter(zakatMalfile, true);
                writeMal.append(String.format("\n%s%8d%10s%10s%18s%15s%20d", nama, usia, jenkel, jenis, telp, alamat, bayar));
                writeMal.close();
                System.out.println("\nZakat Mal atas nama "+nama+" berhasil diterima");
                menuMuzakki();
            } else {
                System.out.println("Pilihan tidak tersedia");
                menuMuzakki();
            }
        }catch (IOException e){
            System.out.println("Input salah!");
            create();
        }catch (NumberFormatException e){
            System.out.println("Input harus berupa numerik!");
            create();
        }
    }

    @Override
    public void readAdmin() throws NumberFormatException, IOException {

        System.out.println("\n");
        System.out.println("=========================");
        System.out.println("||   TAMPILKAN DATA    ||");
        System.out.println("||=====================||");
        System.out.println("||     Pilih Zakat     ||");
        System.out.println("||  [1] Zakat Fitrah   ||");
        System.out.println("||  [2] Zakat Mal      ||");
        System.out.println("=========================");
        System.out.print("Pilih [1-2] : ");
        int pilih = Integer.parseInt(input.readLine());
        
        try {
            if (pilih == 1){
                displayFitrah();
                menuAdmin();
            } else if (pilih == 2){
                displayMal();
                menuAdmin();
            } else {
                System.out.println("Pilihan tidak tersedia");
                readAdmin();
            }
        }catch (NumberFormatException e){
            System.out.println("Pilihan menu hanya berupa angka!");
            readAdmin();
        }
    }

    @Override
    public void readMuzakki() throws IOException {
        System.out.println("\n");
        System.out.println("=========================");
        System.out.println("||   TAMPILKAN DATA    ||");
        System.out.println("||=====================||");
        System.out.println("||     Pilih Zakat     ||");
        System.out.println("||  [1] Zakat Fitrah   ||");
        System.out.println("||  [2] Zakat Mal      ||");
        System.out.println("=========================");
        System.out.print("Pilih [1-2] : ");
        int pilih = Integer.parseInt(input.readLine());
        System.out.println("");
        
        try {
            if (pilih == 1){
                readFitrah();
                System.out.print("Masukkan nama anda : ");
                String namaMuzakki = input.readLine();
                if(zakatFitrah.size() > 0) {
                    System.out.println("DATA ZAKAT FITRAH");
                    headerFitrah();
                    int index = 0;
                    for (String dataFitrah : zakatFitrah) {
                        if (dataFitrah.contains(namaMuzakki)){
                            System.out.println(String.format("[%d] %s", index, dataFitrah));
                            index++;
                        }
                    }menuMuzakki();
                }else {
                    ArrayListKosongmessage();
                    menuMuzakki();
                }
                
            } else if (pilih == 2){
                readMal();
                System.out.print("Masukkan nama anda : ");
                String namaMuzakki = input.readLine();
                if(zakatMal.size() > 0) {
                    System.out.println("DATA ZAKAT MAL");
                    headerMal();
                    int index = 0;
                    for (String dataMal : zakatMal) {
                        if (dataMal.contains(namaMuzakki)){
                            System.out.println(String.format("[%d] %s", index, dataMal));
                            index++;
                        }
                    }menuMuzakki();
                }else {
                    ArrayListKosongmessage();
                    menuMuzakki();
                }
            } else {
                System.out.println("Pilihan tidak tersedia");
                readMuzakki();
            }
        }catch (NumberFormatException e){
            System.out.println("Pilihan menu hanya berupa angka!");
            readMuzakki();
        }
    }
    
    @Override
    public void update() throws IOException {
        String alamat, telp;
        int harga, jenis, bayar;
        System.out.println("\n");
        System.out.println("=========================");
        System.out.println("||      UPDATE DATA    ||");
        System.out.println("||=====================||");
        System.out.println("||     Pilih Zakat     ||");
        System.out.println("||  [1] Zakat Fitrah   ||");
        System.out.println("||  [2] Zakat Mal      ||");
        System.out.println("=========================");
        System.out.print("Pilih [1-2] : ");
        int pilih = Integer.parseInt(input.readLine());

        if(pilih == 1){
            dataEdit = true;
            readFitrah();
            displayFitrah();
            try{
                System.out.println("------------------------");
                System.out.print("ID yang akan diedit : ");
                int index = Integer.parseInt(input.readLine());

                if ((index) > zakatFitrah.size()){
                    throw new IndexOutOfBoundsException("ID "+index+" tidak ada di file Zakat Fitrah");
                }else {
                    System.out.println("\nMasukkan data baru : \n");
                    System.out.print("Masukkan Nama                    : ");
                    String nama = input.readLine();
                    System.out.print("Masukkan Usia                    : ");
                    int usia = Integer.parseInt(input.readLine());
                    System.out.print("Masukkan Jumlah Anggota Keluarga : ");
                    int jumlah = Integer.parseInt(input.readLine());
                    System.out.print("Masukkan Jenis Kelamin (P/L)     : ");
                    String jenkel = input.readLine().toUpperCase();
                    System.out.print("Masukkan No. Telepon             : ");
                    telp = input.readLine();
                    System.out.print("Masukkan Alamat                  : ");
                    alamat = input.readLine();
                    System.out.print("Masukkan Harga Beras perKg       : ");
                    harga = Integer.parseInt(input.readLine());

                    //update command
                    zakatFitrah.set((index), String.format("%s%8d%20d%10s%21s%10s%30d", nama, usia, jumlah, jenkel, telp, alamat, harga));

                    try{
                        FileWriter updateFitrah = new FileWriter(zakatFitrahfile, false);

                        for (String dataFitrah : zakatFitrah){
                            updateFitrah.append(String.format("%s%n", dataFitrah));
                        }
                        updateFitrah.close();

                        System.out.println("\n\t\tID "+index+" berhasil di update");
                    }catch (IOException e){
                        System.out.println(e);
                        menuAdmin();
                    }
                }
            }catch (IOException e){
                System.out.println(e.getMessage());
                update();
            }catch (NumberFormatException e){
                System.out.println("Input harus berupa numerik!");
                update();
            }catch (IndexOutOfBoundsException e){
                System.out.println("ID tidak tersedia!");
                update();
            }
            
        } else if (pilih == 2){
            dataEdit = true;
            readMal();
            displayMal();
            try{
                System.out.println("-------------------------");
                System.out.print("ID yang akan diedit : ");
                int index = Integer.parseInt(input.readLine());

                if ((index) > zakatMal.size()){
                    throw new IndexOutOfBoundsException("ID "+index+" tidak ada di file Zakat Mal");
                }else {
                    System.out.println("\nMasukkan data baru : ");
                    System.out.println();
                    System.out.print("Masukkan Nama                    : ");
                    String nama = input.readLine();
                    System.out.print("Masukkan Usia                    : ");
                    int usia = Integer.parseInt(input.readLine());
                    System.out.print("Masukkan Jenis Kelamin (P/L)     : ");
                    String jenkel = input.readLine().toUpperCase();
                    jenisZakatMal();
                    System.out.print("Masukkan Jenis Zakat Mal         : ");
                    jenis = Integer.parseInt(input.readLine());
                    System.out.print("Masukkan No. Telepon             : ");
                    telp = input.readLine();
                    System.out.print("Masukkan Alamat                  : ");
                    alamat = input.readLine();
                    System.out.print("Masukkan Jumlah Pembayaran       : ");
                    bayar = Integer.parseInt(input.readLine());

                    zakatMal.set(index, String.format("%s%8d%10s%10s%18s%15s%20d", nama, usia, jenkel, jenis, telp, alamat, bayar));

                    try{
                        FileWriter updateMal = new FileWriter(zakatMalfile, false);

                        for (String dataMal : zakatMal){
                            updateMal.append(String.format("%s%n", dataMal));
                        }
                        updateMal.close();

                        System.out.println("ID "+index+" berhasil di update");
                    }catch (IOException e){
                        System.out.println(e);
                    }
                }menuAdmin();
                
            }catch (IOException e){
                System.out.println(e.getMessage());
                update();
            }catch (NumberFormatException e){
                System.out.println("Inputan harus berupa numerik!");
                update();
            }catch (IndexOutOfBoundsException e){
                System.out.println("ID tidak tersedia!");
                update();
            }
            
        }else {
            System.out.println("\nPilihan tidak tersedia");
        }
        dataEdit = false;
        menuAdmin();
    }

    @Override
    public void delete() throws IOException {
        System.out.println("\n");
        System.out.println("=========================");
        System.out.println("||      HAPUS DATA     ||");
        System.out.println("||=====================||");
        System.out.println("||     Pilih Zakat     ||");
        System.out.println("||  [1] Zakat Fitrah   ||");
        System.out.println("||  [2] Zakat Mal      ||");
        System.out.println("=========================");
        System.out.print  ("Pilih [1-2] : ");
        int pilih = Integer.parseInt(input.readLine());
        
        if(pilih == 1){
            dataEdit = true;
            readFitrah();
            try{
                displayFitrah();
                System.out.println("---------------------------");
                System.out.print("ID yang akan dihapus : ");
                int index = Integer.parseInt(input.readLine());

                if (index > zakatFitrah.size()){
                    throw new IndexOutOfBoundsException("ID "+index+" tidak ada di file Zakat Fitrah");
                }else {
                    System.out.println("Data yang akan dihapus : ");
                    System.out.println(String.format("[%d] %s", index,zakatFitrah.get(index)));
                    System.out.print("Apakah anda yakin? (y/t) : ");
                    String jawab = input.readLine();

                    if (jawab.equalsIgnoreCase("y")){
                        zakatFitrah.remove(index);
                        try{
                            FileWriter deleteFitrah = new FileWriter(zakatFitrahfile, false);

                            for (String dataFitrah : zakatFitrah){
                                deleteFitrah.append(String.format("%s%n", dataFitrah));
                            }
                            deleteFitrah.close();

                            System.out.println("Data berhasil dihapus");
                            menuAdmin();
                        }catch (IOException e){
                            System.out.println(e);
                        }
                    }
                }
            }catch (IOException e){
                System.out.println("Input salah!");
                delete();
            }catch (NumberFormatException e){
                System.out.println("Input harus berupa numerik!");
                delete();
            }catch (IndexOutOfBoundsException e){
                System.out.println("ID tidak tersedia!");
                delete();
            }
            
        } else if (pilih == 2){
            dataEdit = true;
            readMal();
            try{
                displayMal();
                System.out.println("---------------------------");
                System.out.print("ID yang akan dihapus : ");
                int index = Integer.parseInt(input.readLine());

                if (index > zakatMal.size()){
                    throw new IndexOutOfBoundsException("ID "+index+" tidak ada di file Zakat Mal");
                }else {
                    System.out.println("Data yang akan dihapus : ");
                    System.out.println(String.format("[%d] %s", index,zakatMal.get(index)));
                    System.out.print("Apakah anda yakin? (y/t) : ");
                    String jawab = input.readLine();

                    if (jawab.equalsIgnoreCase("y")){
                        zakatMal.remove(index);
                        try{
                            FileWriter deleteMal = new FileWriter(zakatMalfile, false);

                            for (String dataMal : zakatMal){
                                deleteMal.append(String.format("%s%n", dataMal));
                            }
                            deleteMal.close();

                            System.out.println("Data berhasil dihapus");
                        }catch (IOException e){
                            System.out.println(e);

                        }
                    }
                }
                
            }catch (IOException e){
                System.out.println("Input salah!");
                delete();
            }catch (NumberFormatException e){
                System.out.println("Input harus berupa numerik!");
                delete();
            }catch (ArrayIndexOutOfBoundsException e){
                System.out.println("ID tidak tersedia!");
                delete();
            }
            
        }else {
            System.out.println("Pilihan tidak tersedia");
            delete();
        }
            }
    
    @Override
    public  void menuAdmin() throws IOException {
        System.out.println("\n\n");
        System.out.println("----------  Halo Admin!   ----------");
        System.out.println("||                                ||");
        System.out.println("||       [1] Lihat Data           ||");
        System.out.println("||       [2] Update Data          ||");
        System.out.println("||       [3] Hapus Data           ||");
        System.out.println("||       [4] Logout               ||");
        System.out.println("||       [5] Exit                 ||");
        System.out.println("||                                ||");
        System.out.println("------------------------------------");
        System.out.print  ("Pilihan Menu [1-5] >> ");
        int pilih = Integer.parseInt(input.readLine());

        try {
            switch(pilih){
                case 1:
                    readAdmin();
                    break;

                case 2:
                    update();
                    break;

                case 3:
                    delete();
                    break;

                case 4:
                    login();
                    break;

                case 5:
                    System.out.println("\nTerimakasih sudah menggunakan program Sistem Manajemen Zakat");
                    System.exit(0);

                default:
                    System.out.println("Pilihan tidak tersedia");
                    menuAdmin();
                    break;
            }
        }catch (NumberFormatException e){
            System.out.println("Pilihan menu hanya berupa angka!");
            menuAdmin();
        }

    }

    @Override
    public void menuMuzakki() throws IOException {
        System.out.println("\n\n");
        System.out.println("---------  Halo Muzakki!  ----------");
        System.out.println("||                                ||");
        System.out.println("||        [1] Tambah Data         ||");
        System.out.println("||        [2] Lihat Data          ||");
        System.out.println("||        [3] Logout              ||");
        System.out.println("||        [4] Exit                ||");
        System.out.println("||                                ||");
        System.out.println("------------------------------------");
        System.out.print  ("Pilihan Menu [1-4] >> ");
        int pilih = Integer.parseInt(input.readLine());

        try {
            switch (pilih) {
                case 1:
                    create();
                    break;

                case 2:
                    readMuzakki();
                    break;

                case 3:
                    login();
                    break;

                case 4:
                    System.out.println("\nTerimakasih sudah menggunakan program Sistem Manajemen Zakat");
                    System.exit(0);

                default: {
                    System.out.println("Pilihan tidak tersedia");
                    menuMuzakki();
                }
            }
        }catch (NumberFormatException e){
            System.out.println("Pilihan menu hanya berupa angka!");
            menuMuzakki();
        }
    }

    final void headerFitrah(){
        System.out.println("ID\tNama\tUsia\tAnggota Keluarga\tJenis Kelamin\t\tTelepon\t\tAlamat\t\t\tJumlah Bayar");
    }

    final void headerMal(){
        System.out.println("ID\tNama\tUsia\tJenis Kelamin\tJenis\tTelepon\t\t\tAlamat\t\t\tJumlah Bayar");

    }

    void jenisZakatMal(){
        System.out.println("=========================");
        System.out.println("||    JENIS ZAKAT MAL  ||");
        System.out.println("||=====================||");
        System.out.println("||  [1] Penghasilan    ||");
        System.out.println("||  [2] Perdagangan    ||");
        System.out.println("||  [3] Emas & Perak   ||");
        System.out.println("||  [4] Pertanian      ||");
        System.out.println("||  [5] Tabungan       ||");
        System.out.println("=========================");
    }  
}