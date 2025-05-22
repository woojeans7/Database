package org.scoula.jdbc_ex.dao;

import org.scoula.jdbc_ex.common.JDBCUtil;
import org.scoula.jdbc_ex.domain.UserVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements UserDao {

    Connection conn = JDBCUtil.getConnection();

    // USERS 테이블 관련 SQL 명령어
    private String USER_LIST = "select * from users";
    private String USER_GET = "select * from users where id = ?";
    private String USER_INSERT = "insert into users values(?, ?, ?, ?)";
    private String USER_UPDATE = "update users set name = ?, role = ? where id = ?";
    private String USER_DELETE = "delete from users where id = ?";

    @Override
    public int create(UserVO user) throws SQLException {
        //1, 2, 3, 4 단계 코드
        //1,2 단계는 해놨기 때문에 함수호출만 하면 연결됨.
        //3,4 단계만 코드하면 됨.!
        PreparedStatement pstmt = conn.prepareStatement(USER_INSERT);
        System.out.println("3단계 : sql문 객체로 만들기 성공함.");
        pstmt.setString(1, "gunja"); //id를 넣음.
        pstmt.setString(2, "gunja"); //pw를 넣음.
        pstmt.setString(3, "gunja"); //name를 넣음.
        pstmt.setString(4, "gunja"); //role를 넣음.

        //4단계 - sql문 db서버로 전송하고 뒷처리
        int count = pstmt.executeUpdate(); //insert문 결과는 실행된 row수
        System.out.println("실행될 row수 " + count);
        pstmt.close();
        return count;
    }

    @Override
    public List<UserVO> getList() throws SQLException {
        return List.of();
    }

    @Override
    public UserVO get(String id) throws SQLException {
        return null;
    }

    @Override
    public int update(UserVO user) throws SQLException {
        return 0;
    }

    @Override
    public int delete(String id) throws SQLException {
        return 0;
    }
}