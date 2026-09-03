package vn.iotstar.util;

import vn.iotstar.util.ConfigLoader;

public class Constant {
    public static final String DIR;
    static {
        DIR = ConfigLoader.get("UPLOAD_DIR", "D:\\Izhary\\HK1_2627\\LTWeb\\upload");
    }
}
