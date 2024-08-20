package semi.cooking.model.dao;

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
import semi.cooking.model.vo.CookingBoard;

public class CookingDao {
	
	private Properties prop = new Properties();
	
	public CookingDao() {
		try {
			prop.loadFromXML(new FileInputStream(CookingDao.class.getResource("/db/sql/cooking-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CookingBoard> selectCookingList(Connection conn){
		ArrayList<CookingBoard> list = new ArrayList<CookingBoard>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCookingList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CookingBoard(rset.getInt("c_no"),
						                  rset.getString("c_title"),
						                  rset.getInt("count"),
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
	
	public int insertCookBoard(Connection conn, CookingBoard c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCookBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getcBoardTitle());
			pstmt.setString(2, c.getcBoardContent());
			pstmt.setInt(3, 1);
			pstmt.setInt(4, c.getCookCategory());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				pstmt.setInt(5, at.getBoardCategory());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int increaseCount(Connection conn, int cBoardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cBoardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public CookingBoard selectCookBoard(Connection conn, int cookBoardNo) {
		CookingBoard cookBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCookBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cookBoardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cookBoard = new CookingBoard(rset.getInt("c.c_no"),
											 rset.getString("c_title"),
											 rset.getString("c_contents"),
											 rset.getDate("c_date"),
											 rset.getString("user_id"),
											 rset.getInt("c_category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cookBoard;
	}
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int cookBoardNo){
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cookBoardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				
				list.add(at);
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
