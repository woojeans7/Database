package org.scoula.jdbc_ex.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.scoula.jdbc_ex.common.JDBCUtil;

// JUnit5를 이용하여 데이터베이스에 접속하는 JDBC 코드를 테스트하세요.
public class ConnectionTest {

    @Test
    @DisplayName("데이터베이스 접속 테스트")
    public void testConnection() throws SQLException, ClassNotFoundException {
        Connection con = null;

        // 1. 드라이버설정
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 2. 데이터베이스연결
        String url = "jdbc:mysql://localhost:3306/jdbc_ex";
        String user = "scoula";
        String password = "1234";

        con = DriverManager.getConnection(url, user, password);
        System.out.println("jdbc_ex 데이터베이스 접속 성공");
    }

    // ConnectionTest 클래스의 testConnection2 메서드에서 JDBCUtil 클래스의 기능을 테스트하세요.
    @Test
    @DisplayName("JDBCUtil 클래스 기능 테스트")
    public void testConnection2() throws SQLException, ClassNotFoundException {
        try(Connection conn = JDBCUtil.getConnection()){
            System.out.println("jdbc_ex 데이터베이스 접속 성공");
        }
    }
}
