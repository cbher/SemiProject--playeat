package db.com.semi.Questions.model.dao;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import db.com.semi.Questions.model.vo.Attatment;
import db.com.semi.Questions.model.vo.Questions;


import static semi.common.JDBCtemplate.*;

public class QuestionsDao {
	
	private Properties prop = new Properties();
	public QuestionsDao() {
		try {
		
		
			prop.loadFromXML(new FileInputStream(QuestionsDao.class.getResource("/db/sql/questions-mapper.xml").getPath()));
	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}
	
	public ArrayList<Questions> QuestionsList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("QuestionsList");

		
		ArrayList<Questions> list = new ArrayList<Questions>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Questions(rset.getInt("inquire_no"),
									   rset.getString("inquire_title"),
									   rset.getString("inquire_content"),
									   rset.getString("USER_ID"),
									   rset.getDate("create_date"),
									   rset.getString("status")));
		
			
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Questions> QuestionsReadyList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("QuestionsReadyList");
	
		
		ArrayList<Questions> list = new ArrayList<Questions>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Questions(rset.getInt("inquire_no"),
									   rset.getString("inquire_title"),
									   rset.getString("inquire_content"),
									   rset.getString("USER_ID"),
									   rset.getDate("create_date"),
									   rset.getString("status")));
		
			
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Questions> QuestionsClearList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("QuestionsClearList");
	
		
		ArrayList<Questions> list = new ArrayList<Questions>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Questions(rset.getInt("inquire_no"),
									   rset.getString("inquire_title"),
									   rset.getString("inquire_content"),
									   rset.getString("USER_ID"),
									   rset.getDate("create_date"),
									   rset.getString("status")));
		
			
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public Questions QuestionDetail(Connection conn, int qno) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("QuestionDetail");
	
		Questions q = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
		
			rset = pstmt.executeQuery();
			while(rset.next()) {
				q = (new Questions(rset.getInt("inquire_no"),
										rset.getString("inquire_title"),
										rset.getString("inquire_content"),
										rset.getString("USER_ID"),
										rset.getDate("create_date"),
										rset.getString("status"),
										rset.getString("answer")));
		
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}
	public int QuestionsUpdate(Connection conn, int qno ,  String answer) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("QuestionsUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, qno);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		} 
		return result;
		
	}
	
	public ArrayList<Attatment> QuestionAt(Connection conn, int qno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("QuestionAt");
		ArrayList<Attatment> list = new ArrayList<Attatment>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
			
				list.add(new Attatment(rset.getInt("file_no"),
									 rset.getString("origin_name"),
									 rset.getString("change_name"),
									 rset.getString("file_path"),
									 rset.getInt("inquire_no")));
				
				
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
	}
}