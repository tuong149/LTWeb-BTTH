package vn.iotstar.util;

import io.github.cdimascio.dotenv.Dotenv;

public class Constant {
    public static final String DIR;
    static {
        Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();
        DIR = dotenv.get("UPLOAD_DIR", "D:\\Izhary\\HK1_2627\\LTWeb\\upload");
    }
}
