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

import semi.cooking.model.vo.Attachment;
import semi.play.model.vo.Play;

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
}
