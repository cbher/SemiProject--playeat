package semi.Review.model.dao;

import static semi.common.JDBCtemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.Review.model.vo.Attachment2;
import semi.Review.model.vo.Review;
import semi.cooking.model.dao.CookingDao;
import semi.cooking.model.vo.Attachment;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		try {
			prop.loadFromXML(new FileInputStream(CookingDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertReview(Connection conn, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println(review);
		String sql = prop.getProperty("insertReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getrTitle());
			pstmt.setString(2, review.getrContent());
			pstmt.setString(3, review.getScore());
			pstmt.setString(4, review.getUserNo());
			pstmt.setString(5, review.getpNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertAttachment(Connection conn, Attachment at) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, at.getUserNo());
			System.out.println(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Review> ReviewList(Connection conn, int placeNo) {
		ArrayList<Review> r = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("Review"); 
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, placeNo);
	        rset = pstmt.executeQuery();
	        
	        while (rset.next()) {
	        	Review review = new Review();
	        	review.setrNo(rset.getString("REVIEW_NO"));
	        	review.setrTitle(rset.getString("R_TITLE"));
	        	review.setrContent(rset.getString("R_CONTENT"));
	        	review.setScore(rset.getString("SCORE"));
	        	review.setrDate(rset.getDate("R_DATE"));
	        	review.setUserName(rset.getString("USER_NAME"));
	        	review.setNickName(rset.getString("NICKNAME"));
	        	review.setUserNo(rset.getString("USER_NO"));
	        	review.setTitleImg(rset.getString("TITLEIMG"));
	        	
	        	r.add(review);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    return r;
	}

	public Review selectReview(Connection conn, int rNo) {
		Review r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review(rset.getString("review_no"),
						       rset.getString("r_title"),
						       rset.getString("r_content"),
						       rset.getDate("r_date"),
						       rset.getString("score"),
						       rset.getString("user_no"),
						       rset.getString("play_no"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}

	public Attachment2 selectAttachment(Connection conn, int rNo) {
		Attachment2 at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment2();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				at.setUserNo(rset.getInt("user_no"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
		
		
	}

	public int reviewUpdate(Connection conn, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reviewUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, review.getrContent());
			pstmt.setString(2, review.getScore());
			pstmt.setString(3, review.getrNo());
			
			
			result = pstmt.executeUpdate();
						
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}
					
					return result;
				}

	public int AttachmentUpdate(Connection conn, semi.cooking.model.vo.Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteReview(Connection conn, int rNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

}
