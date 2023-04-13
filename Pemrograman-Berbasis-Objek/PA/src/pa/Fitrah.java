package pa;

public class Fitrah extends Zakat {
    private int jumlah;
    private int harga;

    public Fitrah(String nama, int usia, int jumlah, String jenkel, String telp, String alamat, int harga) {
        super(nama, usia, jenkel, telp, alamat);
        this.jumlah = jumlah;
        this.harga = harga;
    }        
    
    @Override
    final void display(){
        super.display();
        System.out.println("Jumlah Anggota Keluarga : " + this.jumlah);
        System.out.println("Harga Beras perKg       : " + this.harga);
    }

    public int getJumlah() {
        return jumlah;
    }

    public void setJumlah(int jumlah) {
        this.jumlah = jumlah;
    }    

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }   
}
