package semi.mypage.myInquire.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.common.PageInfo;
import semi.mypage.myInquire.model.vo.Inquire;
import semi.mypage.myReview.model.dao.MyReviewDao;
import static semi.common.JDBCtemplate.*;


public class InquireDao {
	
	
	private Properties prop = new Properties();
	
	public InquireDao() {
		try {
			prop.loadFromXML(new FileInputStream(MyReviewDao.class.getResource("/db/sql/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	 public int getInquireCount(Connection conn, int userNo) {
	        int listCount = 0;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        String sql = prop.getProperty("getInquireCount");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, userNo);
	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                listCount = rset.getInt(1);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return listCount;
	    }

	
	
	
	
	public ArrayList<Inquire> inquireList(Connection conn, PageInfo pi,int userNo){
		
		
		PreparedStatement pstmt = null;
		
		ArrayList<Inquire> i = new ArrayList<Inquire>();
		
		ResultSet rset= null;
		
		String sql = prop.getProperty("inquireList");
			
		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset=pstmt.executeQuery();

			while(rset.next()) {
				i.add(new Inquire(rset.getInt("inquire_no"),
								   rset.getString("inquire_title"),
								   rset.getString("user_name"),
								   rset.getDate("create_date"),
								   rset.getString("status"),
								   rset.getString("answer")));
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
