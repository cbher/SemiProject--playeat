package com.mypage.myInquire.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.mypage.myInquire.model.vo.Inquire;
import com.mypage.myReview.model.dao.MyReviewDao;
import static com.common.JDBCtemplate.*;


public class InquireDao {
	
	
	private Properties prop = new Properties();
	
	public InquireDao() {
		try {
			prop.loadFromXML(new FileInputStream(MyReviewDao.class.getResource("/db/sql/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Inquire> inquireList(Connection conn, int userNo){
		
		
		PreparedStatement pstmt = null;
		
		ArrayList<Inquire> i = new ArrayList<Inquire>();
		
		ResultSet rset= null;
		
		String sql = prop.getProperty("inquireList");
			
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();

			while(rset.next()) {
				i.add(new Inquire(rset.getInt("inquire_no"),
								   rset.getString("inquire_title"),
								   rset.getString("user_name"),
								   rset.getDate("create_date"),
								   rset.getString("status")));
			   } 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return i;
	

		
	}
	
	
	
	
}
