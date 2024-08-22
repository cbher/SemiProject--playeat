package semi.mypage.myReview.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.member.model.vo.Member;
import semi.mypage.myReview.model.vo.Review;

import static semi.common.JDBCtemplate.*;
import static semi.common.JDBCtemplate.*;


public class MyReviewDao {

	private Properties prop = new Properties();
	
	public MyReviewDao() {
		try {
			prop.loadFromXML(new FileInputStream(MyReviewDao.class.getResource("/db/sql/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Review> selectList(Connection conn, int userNo){
		
		ArrayList<Review> list = new ArrayList<Review>();
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();
			
		
				while(rset.next()) {
					list.add(new Review(rset.getInt("review_no"),
							           rset.getString("r_title"),
							           rset.getString("r_content"),
									   rset.getDate("r_date"),
									   rset.getString("p_title")));
				} 
		    }catch (SQLException e) {
			e.printStackTrace();
			}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	 
	
	}
	
	
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	

