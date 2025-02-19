package semi.oneday.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import static semi.common.JDBCtemplate.*;

import semi.common.PageInfo;
import semi.cooking.model.vo.Attachment;
import semi.oneday.model.vo.Comment;
import semi.oneday.model.vo.Oneday;
import semi.play.model.vo.Play;

public class OnedayDao {
	private Properties prop = new Properties();
	
	public OnedayDao() {
		try {
			prop.loadFromXML(new FileInputStream(OnedayDao.class.getResource("/db/sql/oneday-mapper.xml").getPath()) );
		} catch (IOException e) {
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
	
	public ArrayList<Oneday> selectOnedayList(PageInfo pi, Connection conn){
		ArrayList<Oneday> list = new ArrayList<Oneday>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOnedayList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Oneday(rset.getInt("one_no"),
									rset.getString("one_title"),
									rset.getString("one_place"),
									rset.getInt("ent_people"),
									rset.getDouble("score"),
									rset.getInt("price"),
									rset.getString("titleimg")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Oneday> selectPopularList(Connection conn){
		ArrayList<Oneday> popularList = new ArrayList<Oneday>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPopularList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				popularList.add(new Oneday(rset.getInt("one_no"),
									rset.getString("one_title"),
									rset.getDouble("score"),
									rset.getInt("price"),
									rset.getString("titleimg")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return popularList;
	}

	public Oneday detailOneday(Connection conn, int oneNo) {
		Oneday o= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailOneday");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oneNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new Oneday(rset.getInt("one_no"),
							  rset.getString("titleimg"),
							  rset.getString("one_title"),
							  rset.getString("one_phone"),
							  rset.getString("one_place"),
							  rset.getDouble("score"),
							  rset.getInt("price"),
							  rset.getString("start_time"),
							  rset.getString("end_time"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return o;
	}

	public ArrayList<Attachment> DetailAttachmentList(Connection conn, int oneNo) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oneNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFilePath(rset.getString("file_path"));
				at.setOriginName(rset.getString("origin_name"));
				
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

	public ArrayList<Comment> commentView(Connection conn, int oneNo) {
	    ArrayList<Comment> commentList = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("commentView"); // Assuming the SQL query is defined in oneday-mapper.xml
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, oneNo);
	        rset = pstmt.executeQuery();
	        
	        while (rset.next()) {
	            Comment comment = new Comment();
	            comment.setComContent(rset.getString("COM_CONTENT"));
	            comment.setScore(rset.getInt("SCORE"));
	            comment.setCreateDate(rset.getDate("CREATE_DATE"));
	            comment.setUserName(rset.getString("USER_NAME"));
	            comment.setNickName(rset.getString("NICKNAME"));
	            comment.setUserNo(rset.getInt("USER_NO"));
	            comment.setComNo(rset.getInt("COM_NO"));
	            commentList.add(comment);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    return commentList;
	}

	public int insertComment(Connection conn, Comment com) {
		int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("insertComment"); 

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, com.getComContent());
            pstmt.setInt(2, com.getScore());
            pstmt.setInt(3, com.getUserNo());
            pstmt.setInt(4, com.getOneNo());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
	}

	public int selectLike(Connection conn, int oneNo, int userNo) {
		int likeCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, oneNo);
			
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

	public int insertLike(Connection conn, int oneNo, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, oneNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteLike(Connection conn, int oneNo, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, oneNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Oneday> anotherList(Connection conn, int oneNo) {
		ArrayList<Oneday> list = new ArrayList<Oneday>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAnotherList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oneNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Oneday o = new Oneday();
				o.setOneNo(rset.getInt("ONE_NO"));
				o.setOneTitle(rset.getString("ONE_TITLE"));
				o.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(o);
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
