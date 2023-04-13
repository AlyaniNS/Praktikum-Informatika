package pa;

import java.io.IOException;

public interface Method {
    void menuAdmin() throws IOException;
    void menuMuzakki() throws IOException;
    void create() throws IOException;
    void readAdmin() throws IOException;
    void readMuzakki() throws IOException;
    void update() throws IOException;
    void delete() throws IOException;
}
