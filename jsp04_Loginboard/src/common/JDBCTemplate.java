package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01. 드라이버 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("01. 드라이버 연결 실패");
			e.printStackTrace();
		}

		Connection con = null;

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hk";
		String pw = "hk";

		try {
			con = DriverManager.getConnection(url, id, pw);
			con.setAutoCommit(false);
			System.out.println("02. 계정 연결 성공");
		} catch (SQLException e) {
			System.out.println("02. 계정 연결 실패");
			e.printStackTrace();
		}

		return con;

	}
	public static void Close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("connection close error");
			e.printStackTrace();
		}

	}
	public static void Close(Statement stmt) {
		try {
			stmt.close();
		} catch (SQLException e) {
			System.out.println("Statement close error");
			e.printStackTrace();
		}
	}
	public static void Close(ResultSet res) {
		try {
			res.close();
		} catch (SQLException e) {
			System.out.println("ResultSet close error");
			e.printStackTrace();
		}
	}
	
	public static void Commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			System.out.println("Commit error");
			e.printStackTrace();
		}
	}
	public static void Rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			System.out.println("Rollback error");
			e.printStackTrace();
		}
	}

}
