package vn.iotstar.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public Connection getConnection() throws Exception {
        // Đường dẫn kết nối tới database mvc_3tier_db trên MySQL
        String url = "jdbc:mysql://localhost:3306/mvc_3tier_db?useUnicode=true&characterEncoding=UTF-8";
        String user = "root";
        String password = "14092006"; // ĐIỀN MẬT KHẨU CỦA BẠN VÀO ĐÂY

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}