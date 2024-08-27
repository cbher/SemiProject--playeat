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

import semi.common.PageInfo;
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
	
	public ArrayList<CookingBoard> selectCookingList(Connection conn, PageInfo pi){
		ArrayList<CookingBoard> list = new ArrayList<CookingBoard>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCookingList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CookingBoard(rset.getInt("c_no"),
						                  rset.getString("c_title"),
						                  rset.getInt("count"),
						                  rset.getString("titleimg"),
						                  rset.getInt("c_star")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	public int insertCookBoard(Connection conn, CookingBoard c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCookBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getcBoardTitle());
			pstmt.setString(2, c.getcBoardContent());
			pstmt.setString(3, c.getUserNo());
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
				cookBoard = new CookingBoard(rset.getInt("c_no"),
											 rset.getString("c_title"),
											 rset.getString("c_contents"),
											 rset.getDate("c_date"),
											 rset.getString("user_id"),
											 rset.getInt("c_category"),
											 rset.getInt("c_star"));
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
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
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
	
	public int updateCookBoard(Connection conn, CookingBoard cBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCookBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cBoard.getcBoardTitle());
			pstmt.setString(2, cBoard.getcBoardContent());
			pstmt.setInt(3, cBoard.getCookCategory());
			pstmt.setInt(4, cBoard.getcBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteCookBoard(Connection conn, int cBoardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCookBoard");
		
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
	
	public int increaseLike(Connection conn, int cBoardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseLike");
		
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
	
	public int insertLikeList(Connection conn, int bno, int userNo) {
		int insertResult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bno);
			
			insertResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insertResult;
		
	}
	
	public int selectLikeList(Connection conn, int bno, int userNo) {
		int likeCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bno);
			
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
	
	public int decreaseLike(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("decreaseLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteLikeList(Connection conn , int bno, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLikeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
}
