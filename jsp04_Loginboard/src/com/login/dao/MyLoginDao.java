package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.login.dto.MyLoginDto;

import common.JDBCTemplate;

public class MyLoginDao extends JDBCTemplate {

/*	*������ ���(ADMIN)
	*1.ȸ�� ��ü ����
	*2.���Ե� ȸ��(myenabled:Y)�� ��ü ����
	*3.ȸ�� ��� ����
	*/
	
	//ȸ�� ��ü ����
	public List<MyLoginDto> selectAll(){
		
	Connection con = getConnection();	
	Statement stmt = null;
	ResultSet rs= null;
	List<MyLoginDto> res = new ArrayList<>();
 	
	String sql= "SELECT*FROM MYMEMBER ORDER BY MYNO DESC";
	
	try {
		stmt=con.createStatement();
		System.out.println("03. query�� ���� �غ�");
		
		rs= stmt.executeQuery(sql);
		System.out.println("04. db�� return:"+sql);
		
		while(rs.next()) {
			MyLoginDto tmp = new MyLoginDto(); 
			tmp.setMyno(rs.getInt(1));
			tmp.setMyid(rs.getString(2));
			tmp.setMypw(rs.getString(3));
			tmp.setMyname(rs.getString(4));
			tmp.setMyaddr(rs.getString(5));
			tmp.setMyphone(rs.getString(6));
			tmp.setMyemail(rs.getString(7));
			tmp.setMyenabled(rs.getString(8));
			tmp.setMyrole(rs.getString(9));
			
			res.add(tmp);
		}
		if(res.size()>0) {
			Commit(con);
		}else {
			Rollback(con);
		}
	} catch (SQLException e) {
		System.out.println("03/04�ܰ� error");
		e.printStackTrace();
		Rollback(con);
	}finally {
		Close(rs);
		Close(stmt);
		Close(con);
		System.out.println("05. db ���� ����");
	}
	
	return res;		
	}
	
	//���Ե� ȸ���� ��ü ����
	public List<MyLoginDto> selectEnabled(){
		
		Connection con = getConnection();	
		Statement stmt = null;
		ResultSet rs= null;
		List<MyLoginDto> res = new ArrayList<>();
	 	
		String sql= "SELECT*FROM MYMEMBER WHERE MYENABLED='Y' ORDER BY MYNO DESC";
		
		try {
			stmt=con.createStatement();
			System.out.println("03. query�� ���� �غ�");
			
			rs= stmt.executeQuery(sql);
			System.out.println("04. db�� return:"+sql);
			
			while(rs.next()) {
				MyLoginDto tmp = new MyLoginDto(); 
				tmp.setMyno(rs.getInt(1));
				tmp.setMyid(rs.getString(2));
				tmp.setMypw(rs.getString(3));
				tmp.setMyname(rs.getString(4));
				tmp.setMyaddr(rs.getString(5));
				tmp.setMyphone(rs.getString(6));
				tmp.setMyemail(rs.getString(7));
				tmp.setMyenabled(rs.getString(8));
				tmp.setMyrole(rs.getString(9));
				
				res.add(tmp);
			}
			if(res.size()>0) {
				Commit(con);
			}else {
				Rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("03/04�ܰ� error");
			e.printStackTrace();
			Rollback(con);
		}finally {
			Close(rs);
			Close(stmt);
			Close(con);
			System.out.println("05. db ���� ����");
		}
		
		return res;		
	}
	//ȸ�� ��� ����
	public int updateRole(int no, String role) {
		
		Connection con= getConnection();
		PreparedStatement pstm=null;
		int res=0;
		String sql="UPDATE MYMEMBER SET MYROLE=? WHERE MYNO=?";
		
		try {
			pstm=con.prepareStatement(sql);
			
			pstm.setString(1, role);
			pstm.setInt(2, no);
			System.out.println("03. query ���� �غ�");
			
			System.out.println("04. query ��� ����:"+sql);
			res=pstm.executeUpdate();
			if(res>0) {
				Commit(con);
			}else {
				Rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("03/04 �ܰ� error");
			e.printStackTrace();
			Rollback(con);
		}finally {
		
			Close(pstm);
			Close(con);
			System.out.println("05. db ���� ����");
		}
		
		return res;
	}
	
	/*����� ���(USER)
	*1. ȸ������-> ���̵� �ߺ�üũ
	*2. �α���
	*3. �� ���� ��ȸ
	*4. �� ���� ����(�ּ�, ��ȭ��ȣ, �̸���)
	*5. ȸ�� Ż��
	*/
	//ȸ������
	public int insertUser(MyLoginDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql="INSERT INTO MYMEMBER VALUES(MYNOSQ.NEXTVAL,?,?,?,?,?,?,'Y','USER')";
		
		try {
			pstm=con.prepareStatement(sql);
			
			pstm.setString(1, dto.getMyid());
			pstm.setString(2, dto.getMypw());
			pstm.setString(3, dto.getMyname());		
			pstm.setString(4, dto.getMyaddr());
			pstm.setString(5, dto.getMyphone());
			pstm.setString(6, dto.getMyemail());
		

			System.out.println("03. query�� ���� �غ�:"+sql);
			
			System.out.println("04. query�� ��� ����:" +sql);
			res=pstm.executeUpdate();
			
			if(res>0) {
				Commit(con);
			}else {
				Rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("03/04�ܰ� error");
			e.printStackTrace();
			Rollback(con);
		}finally {
			Close(pstm);
			Close(con);
		System.out.println("05. db ���� ����");
		}
		
		return res;
	}
		
	//���̵� �ߺ�üũ
	public MyLoginDto idChk(String id){
		
		Connection con= getConnection();
		PreparedStatement pstm= null;
		ResultSet rs=null;
		
		MyLoginDto res  = new MyLoginDto();
		
		String sql ="SELECT MYID FROM MYMEMBER WHERE MYID=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03. query�� ���� �غ� :"+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04. db �� return");
			while(rs.next()) {
				res.setMyid(rs.getString(1));
			}
			if(res.getMyid() !=null) {
				Commit(con);
			}
					
		} catch (SQLException e) {
			System.out.println("03/04 �ܰ� ����");
			Rollback(con);
			e.printStackTrace();	
		}finally {
			Close(rs);
			Close(pstm);
			Close(con);
			System.out.println("05. db ���� ����");
		}
		return res;
	}
	//�α���
	public MyLoginDto selectLogin(String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		MyLoginDto res = new MyLoginDto();
		
		String sql ="SELECT * FROM MYMEMBER WHERE MYID=? AND MYPW=? AND MYENABLED=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			pstm.setString(3, "Y");
			System.out.println("03. query�� ���� �غ�:"+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04. db �� return");
			
			while(rs.next()) {
				res.setMyno(rs.getInt(1));
				res.setMyid(rs.getString(2));
				res.setMypw(rs.getString(3));
				res.setMyname(rs.getString(4));
				res.setMyaddr(rs.getString(5));
				res.setMyphone(rs.getString(6));
				res.setMyemail(rs.getString(7));
				res.setMyenabled(rs.getString(8));
				res.setMyrole(rs.getString(9));
			}			
			if(res.getMyno()>0) {
				Commit(con);
			}						
		} catch (SQLException e) {
			Rollback(con);
			System.out.println("03/04�ܰ� ����");
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstm);
			Close(con);
			System.out.println("05. db ���� ����");
		}
		return res;
	}
	//�� ���� ��ȸ(select no)
	public MyLoginDto selectUser(int no) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyLoginDto res = new MyLoginDto();
		String sql="SELECT * FROM MYMEMBER WHERE MYNO=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, no);
			System.out.println("03. query ���� �غ�");
			System.out.println("04. query ��� ����:"+sql);	
			rs=pstm.executeQuery();
			
			while(rs.next()) {
				res.setMyno(rs.getInt(1));
				res.setMyid(rs.getString(2));
				res.setMypw(rs.getString(3));
				res.setMyname(rs.getString(4));
				res.setMyaddr(rs.getString(5));
				res.setMyphone(rs.getString(6));
				res.setMyemail(rs.getString(7));
				res.setMyenabled(rs.getString(8));
				res.setMyrole(rs.getString(9));
			}
			if(res.getMyno()>0) {
				Commit(con);
			}else {
				Rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("03 / 04 �ܰ� error");
			e.printStackTrace();
			Rollback(con);
		
		}finally{
			Close(rs);
			Close(pstm);
			Close(con);
			System.out.println("05. db ���� ����");
		}

		return res;
	}
	
	public int update(MyLoginDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm=null;
		int res=0;
		String sql="UPDATE MYMEMBER SET MYPW=?,MYADDR=?,MYPHONE=?,MYEMAIL=? WHERE MYNO=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, dto.getMypw());
			pstm.setString(2, dto.getMyaddr());
			pstm.setString(3, dto.getMyphone());
			pstm.setString(4, dto.getMyemail());
			pstm.setInt(5, dto.getMyno());
			System.out.println("03. query ���� �غ�");
			
			System.out.println("04. query ��� ����:"+sql);
			
			res=pstm.executeUpdate();
			
			if(res>0) {
				Commit(con);
			}else{
				Rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("03/04 �ܰ� error");
			e.printStackTrace();
			Rollback(con);
			
		}finally {
			Close(pstm);
			Close(con);
			System.out.println("05. db ���� ����");
		}
		
		return res;
	}
	
	public int userdel(int no) {
		Connection con = getConnection();
		PreparedStatement pstm=null;
		int res=0;
		String sql="UPDATE MYMEMBER SET MYENABLED='N' WHERE MYNO=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, no);
			System.out.println("03. query ���� �غ�");
			
			System.out.println("04. query ��� ����:"+sql);
			
			res=pstm.executeUpdate();
			
			if(res>0) {
				Commit(con);
			}else{
				Rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("03/04 �ܰ� error");
			e.printStackTrace();
			Rollback(con);
			
		}finally {
			Close(pstm);
			Close(con);
			System.out.println("05. db ���� ����");
		}
		
		return res;
	}
	
}
