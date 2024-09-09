package semi.mypage.myReview.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.common.PageInfo;
import semi.member.model.vo.Member;
import semi.mypage.myReview.model.vo.Review;

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
	
	
	public ArrayList<Review> selectList(Connection conn, PageInfo pi, int userNo, String sort) {
	    ArrayList<Review> list = new ArrayList<Review>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    String sql = prop.getProperty("selectList");
	    switch (sort) {
	        case "score":
	            sql += " ORDER BY SCORE DESC";
	            break;
	        case "date":
	        default:
	            sql += " ORDER BY R_DATE DESC";
	            break;
	            // 정렬버튼 선택 시 해당 sql구문을 mapper 아래쪽에 추가해서 정렬시킴
	    }

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, userNo);
	        int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	        int endRow = startRow + pi.getBoardLimit() - 1;
	        pstmt.setInt(2, startRow);
	        pstmt.setInt(3, endRow);

	        rset = pstmt.executeQuery();

	        while (rset.next()) {
	            list.add(new Review(
	                rset.getInt("review_no"),
	                rset.getString("r_title"),
	                rset.getString("r_content"),
	                rset.getDate("r_date"),
	                rset.getString("p_title"),
	                rset.getInt("score"),
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
	
	
	public int getListCount(Connection conn, int userNo) {
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("getListCount");

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
	public int deleteMyReview(Connection conn, int reviewNo) {
		
		int result =0;
		PreparedStatement pstmt=null;
		
		
		String sql=prop.getProperty("deleteMyReview");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;

	}
	
	
	
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	

