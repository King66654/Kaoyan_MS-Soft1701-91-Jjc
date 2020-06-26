package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAOUtils {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/king?useSSL=false&serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "kobe";
    static Connection conn = null;
    static {
        loadDriver();
    }
    private static void loadDriver(){
        try{
            Class.forName(JDBC_DRIVER);
            System.out.println("驱动已加载!");
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }
    }
    public static Connection getConnection() throws SQLException{
        if (null == conn){
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
        }
        return conn;
    }
    public static void close(){
        try {
            if ((conn != null ) && (!conn.isClosed())){
                conn.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        System.out.println("连接已关闭！");
    }
    public static void main(String[] args) {

    }
}