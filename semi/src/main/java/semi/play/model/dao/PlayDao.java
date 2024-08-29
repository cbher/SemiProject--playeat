package semi.play.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCtemplate.*;

import semi.Review.model.vo.Review;
import semi.cooking.model.vo.Attachment;
import semi.play.model.vo.Play;
import semi.play.model.vo.PlayReply;

public class PlayDao {
	
	private Properties prop = new Properties();
	
	public PlayDao() {
		try {
			prop.loadFromXML(new FileInputStream(PlayDao.class.getResource("/db/sql/play-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Play> selectPlayList(Connection conn){
		ArrayList<Play> list = new ArrayList<Play>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPlayList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Play(rset.getInt("p_no"),
								  rset.getString("p_title"),
								  rset.getString("address"),
								  rset.getString("p_call"),
								  rset.getDouble("P_score"),
								  rset.getString("titleimg")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Play selectDetailPlay(Connection conn, int placeNo) {
		Play p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDetailPlay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Play();
				p.setPlaceNo(rset.getInt("P_NO"));
				p.setPlaceTitle(rset.getString("P_TITLE"));
				p.setAddress(rset.getString("ADDRESS"));
				p.setPlaceCall(rset.getString("P_CALL"));
				p.setScore(rset.getDouble("P_SCORE"));
				p.setBusinessTime(rset.getString("BUSINESSTIME"));
				p.setTemaCategory(rset.getInt("tem_cate_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
		
	}
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int placeNo){
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getInt("file_no"),
										rset.getString("origin_name"),
										rset.getString("change_name"),
										rset.getString("file_path")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<Play> selectPlaySimilarList(Connection conn, int categoryNo, int placeNo){
		ArrayList<Play> list = new ArrayList<Play>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPlaySimilarList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			pstmt.setInt(2, placeNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Play p = new Play();
				p.setPlaceNo(rset.getInt("p_no"));
				p.setPlaceTitle(rset.getString("p_title"));
				p.setTitleImg(rset.getString("titleimg"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<PlayReply> selectPlayReply(Connection conn, int placeNo){
		ArrayList<PlayReply> list = new ArrayList<PlayReply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPlayReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PlayReply(rset.getInt("com_no"),
									   rset.getString("com_content"),
									   rset.getInt("score"),
									   rset.getDate("create_date"),
									   rset.getString("user_id")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertReply(Connection conn, PlayReply pr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pr.getComment());
			pstmt.setInt(2, pr.getScore());
			pstmt.setString(3, pr.getUserId());
			pstmt.setInt(4, pr.getPlaceNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public double selectScore(Connection conn, int placeNo) {
		double score = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectScore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				score = rset.getDouble("avg");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return score;
		
	}
	
	public int selectLikeCount(Connection conn, int placeNo, int userNo) {
		int likeCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLikeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, placeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				likeCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return likeCount;
		
	}
	
	public int insertLikeList(Connection conn, int placeNo, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, placeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int deleteLikeList(Connection conn, int placeNo, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, placeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public ArrayList<Play> recentRestaurant(Connection conn, int placeNo) {
		ArrayList<Play> recentRestaurant = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("recentRestaurant"); 
	    try {
	    	pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Play p = new Play();
				p.setPlaceNo(rset.getInt("p_no"));
				p.setPlaceTitle(rset.getString("p_title"));
				p.setTitleImg(rset.getString("titleimg"));
	        	
	        	recentRestaurant.add(p);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    return recentRestaurant;
	}
}
