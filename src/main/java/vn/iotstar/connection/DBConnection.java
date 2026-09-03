package vn.iotstar.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import vn.iotstar.util.ConfigLoader;

public class DBConnection {
    public Connection getConnection() throws Exception {
        String url = ConfigLoader.get("DB_URL", "jdbc:mysql://localhost:3306/mvc_3tier_db?useUnicode=true&characterEncoding=UTF-8");
        String user = ConfigLoader.get("DB_USER", "root");
        String password = ConfigLoader.get("DB_PASSWORD", "");
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
