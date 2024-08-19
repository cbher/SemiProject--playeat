package com.mypage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.member.model.vo.Member;
import com.review.model.vo.Review;

import static com.common.JDBCtemplate.*;

public class MypageDao {

	private Properties prop = new Properties();
	
	public MypageDao() {
		try {
			prop.loadFromXML(new FileInputStream(MypageDao.class.getResource("/db/sql/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Review> selectList(Connection conn, int userNo){
		
		ArrayList<Review> r = null;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();
			
		
				while(rset.next()) {
					r.add(new Review(rset.getInt("review_no"),
							           rset.getString("r_title"),
							           rset.getString("r_content"),
									   rset.getDate("r_date"),
									   rset.getInt("score"),
									   rset.getInt("user_no"),
									   rset.getString("status"),
									   rset.getInt("play_no")));
				} 
		    }catch (SQLException e) {
			e.printStackTrace();
			}finally {
			close(rset);
			close(pstmt);
		}
		return r;
		
	 
	
	}
	
	
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	

