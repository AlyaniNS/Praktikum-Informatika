package pa;

public class Mal extends Zakat {
    private String jenis;
    private final int bayar;

    public Mal(String nama, int usia, String jenkel, String jenis, String telp, String alamat, int bayar) {
        super(nama, usia, jenkel, telp, alamat);
        this.jenis = jenis;
        this.bayar = bayar;
    }

    @Override
    final void display(){
        super.display();
        System.out.println("Jenis Zakat Mal         : " + this.jenis);
        System.out.println("Jumlah Pembayaran       : " + this.bayar);
    }

    public String getJenis() {
        return jenis;
    }

    public void setJenis(String jenis) {
        this.jenis = jenis;
    } 
}
