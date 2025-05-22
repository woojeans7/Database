package org.scoula.jdbc_ex.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

// org.scoula.jdbc_ex.common 패지키에 JDBCUtil 클래스를 작성하세요.
public class JDBCUtil {
    static Connection conn = null;
    // getConnection() 스태틱 메서드를 정의함
    public static Connection getConnection(){
        if (conn != null) return conn;
        try{
            // Properties 클래스를 이용하여 application.properties 파일을 로드함
            Properties props = new Properties();
            props.load(JDBCUtil.class.getResourceAsStream("/application.properties"));

            // 데이터베이스 접속에 필요한 정보를 추출함
            String driver = props.getProperty("driver");
            String url = props.getProperty("url");
            String username = props.getProperty("username");
            String password = props.getProperty("password");

            Class.forName(driver);
            // jdbc_ex 데이터베이스에 접속하여 Connection 객체를 보관함
            conn = DriverManager.getConnection(url, username, password);
        } catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    // 데이터베이스 접속을 끊는 close() 메서드를 정의함
    public static void close(){
        try {
            if(conn != null){
                conn.close();
                conn = null;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
