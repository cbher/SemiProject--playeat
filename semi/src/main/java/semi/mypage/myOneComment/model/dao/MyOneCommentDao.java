package semi.mypage.myOneComment.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.common.PageInfo;
import semi.mypage.myOneComment.model.vo.OneComment;
import semi.mypage.myReview.model.dao.MyReviewDao;
import static semi.common.JDBCtemplate.*;

public class MyOneCommentDao {

	private Properties prop = new Properties();
	
	public MyOneCommentDao() {
		try {
			prop.loadFromXML(new FileInputStream(MyReviewDao.class.getResource("/db/sql/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	 public int getListCount(Connection conn, int userNo) {
	        int listCount = 0;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        String sql = prop.getProperty("getOneCommentCount");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, userNo);
	            pstmt.setInt(2, userNo);
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
	 
	 
	 
	 public ArrayList<OneComment> oneCommentList(Connection conn, PageInfo pi, int userNo, String sort) {
		    ArrayList<OneComment> list = new ArrayList<>();
		    PreparedStatement pstmt = null;
		    ResultSet rset = null;
		    String sql = prop.getProperty("oneCommentList");

		    if ("score".equals(sort)) {
		        sql += " ORDER BY SCORE DESC";
		    } else {
		        sql += " ORDER BY CREATE_DATE DESC";
		    }

		    try {
		        pstmt = conn.prepareStatement(sql);
		        int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		        int endRow = startRow + pi.getBoardLimit() - 1;

		        pstmt.setInt(1, userNo);
		        pstmt.setInt(2, startRow);
		        pstmt.setInt(3, endRow);
		        
		        rset = pstmt.executeQuery();

		        while (rset.next()) {
		            list.add(new OneComment(
		                rset.getInt("com_no"),
		                rset.getString("com_content"),
		                rset.getInt("score"),
		                rset.getDate("create_date"),
		                rset.getString("status"),
		                rset.getString("p_title"),
		                rset.getString("file_path"),   
		                rset.getString("change_name")  
		            ));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        close(rset);
		        close(pstmt);
		    }

		    return list;
		}
	
	public int DeleteOneComment(Connection conn, int oneComment) {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("deleteOneComment");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oneComment);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
		
		
	}
	
	
}
