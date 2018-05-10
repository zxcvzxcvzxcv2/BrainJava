package com.malldb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


class JDBCExample {
    public static void main(String args[]) {
    	// 1단계 : DB 연결을 위한 커넥션 인터페이스
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        //try ~ catch 문에서 DB연결 중에 예외가 발생하는지를 검사.
        try {
        	//2단계 : JDBC드라이버를 로드한다.
            Class.forName("com.mysql.jdbc.Driver");
            //3단계 : 드라이버매니저 getConnection 메소드 클래스는 DB를 연결한다.
            conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/malldb", "root", "12345");
            System.out.println("데이터베이스에 접속했습니다.");
            
            //malldb 접속정보
            //show processlist;
            //select now();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select now()");

            
            if(rs.next())  //레코드(데이터)가 있으면 rs를 레코드에 첫줄로 이동한다.
            	System.out.println(rs.getString(1));
            else
            	System.out.println("출력된 레코드가 없습니다.");

            
            //4단계 : DB연결을 종료한다.
            conn.close();
        }
        catch (ClassNotFoundException cnfe) {
            System.out.println("해당 클래스를 찾을 수 없습니다." + 
                               cnfe.getMessage());
        }
        catch (SQLException se) {
            System.out.println(se.getMessage());
        }
    }
}
