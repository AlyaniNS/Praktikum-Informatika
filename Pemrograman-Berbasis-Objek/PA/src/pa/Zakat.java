package pa;

public abstract class Zakat {
    protected String nama;
    protected int usia;
    protected String jenkel;
    protected String telp;
    protected String alamat;

    public Zakat(String nama, int usia, String jenkel, String telp, String alamat) {
        this.nama = nama;
        this.usia = usia;
        this.jenkel = jenkel;
        this.telp = telp;
        this.alamat = alamat;
    }
    
    public String getNama() {
        return nama;
    }

    public int getUsia() {
        return usia;
    }

    public String getJenkel() {
        return jenkel;
    }

    public String getTelp() {
        return telp;
    }

    public String getAlamat() {
        return alamat;
    }

    void display() {        
        System.out.println("Nama                    : " + this.nama);
        System.out.println("Usia                    : " + this.usia + " tahun");
        System.out.println("Jenis Kelamin           : " + this.jenkel);
        System.out.println("No. Telp                : " + this.telp);
        System.out.println("Alamat                  : Jl. " + this.alamat);
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }

    public void setUsia(int usia) {
        this.usia = usia;
    }

    public void setJenkel(String jenkel) {
        this.jenkel = jenkel;
    }

    public void setTelp(String telp) {
        this.telp = telp;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }
    
}
