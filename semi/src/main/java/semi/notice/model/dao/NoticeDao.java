package semi.notice.model.dao;

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
import semi.notice.model.vo.Attechment;
import semi.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop =new Properties();
	
	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(Notice.class.getResource("/db/sql/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset =pstmt.executeQuery();
			
			if(rset.next()) {
				listCount=rset.getInt("count");
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	
	
	public ArrayList<Notice> noticeSelectList(Connection conn, PageInfo pi) {
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeSelectList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no")
						           , rset.getString("notice_title")
						           , rset.getString("user_id")
						           , rset.getInt("count")
						           , rset.getDate("create_date")
						           ));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	public int increaseCount(int noticeNo, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Notice noticeDetailView(Connection conn, int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeDetailView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
		
			if(rset.next()) {
				n = new Notice(rset.getInt("NOTICE_NO")
						     , rset.getString("NOTICE_TITLE")
						     , rset.getString("NOTICE_CONTENT")
						     , rset.getString("USER_ID")
						     , rset.getDate("CREATE_DATE"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}

	public int updateNotice(Connection conn, Notice n) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		close(pstmt);
		return result;
	}

	public Notice noticeSelect(Connection conn, int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_no")
							 , rset.getString("notice_title")
							 , rset.getString("notice_content")
							 , rset.getString("user_id")
							 , rset.getDate("create_date"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}

	public int noticeDelete(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("noticeDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}	
		return result;
	}

	public ArrayList<Attechment> selectAttechment(Connection conn, int noticeNo) {
		ArrayList<Attechment> list = new ArrayList<Attechment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttechment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attechment at = new Attechment();
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertAttechment(Connection conn, ArrayList<Attechment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttechment");
		
		
			try {
				for(Attechment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result = pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		return result;
	}

	public int updateAttechment(Connection conn, Attechment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttechment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertNewAttechment(Connection conn, Attechment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getFileNo());
			pstmt.setInt(2, at.getNoticeNo());
			pstmt.setString(3, at.getOriginName());
			pstmt.setString(4, at.getChangeName());
			pstmt.setString(5, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}




	
	
	

}
