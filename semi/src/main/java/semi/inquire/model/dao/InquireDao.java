package semi.inquire.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import org.apache.catalina.tribes.UniqueId;

import static semi.common.JDBCtemplate.*;
import semi.common.PageInfo;
import semi.inquire.model.vo.Inquire;


public class InquireDao {
	
	
	   private Properties prop = new Properties();
	
			
	public InquireDao() {
		try {
			prop.loadFromXML(new FileInputStream(Inquire.class.getResource("/db/sql/inquire-mapper.xml").getPath()));
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
			rset = pstmt.executeQuery();
			
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
	
	public ArrayList<Inquire> inquireSelectList(Connection conn, PageInfo pi) {
		
		ArrayList<Inquire> list = new ArrayList<Inquire>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("inquireSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Inquire(rset.getInt("INQUIRE_NO")
						            , rset.getString("INQUIRE_TITLE")
						            , rset.getString("USER_ID")
						            , rset.getDate("CREATE_DATE")
						            , rset.getString("STATUS")));
						           
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

	public int insertInquire(Connection conn, Inquire inq) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertInquire");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inq.getInquireTitle());
			pstmt.setString(2, inq.getInquireContent());
			pstmt.setString(3, inq.getInquireWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Inquire detailViewInq(Connection conn, int inquireNo) {
		Inquire inq = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailViewInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquireNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				inq = new Inquire(rset.getInt("INQUIRE_NO")
						        , rset.getString("INQUIRE_TITLE")
						        , rset.getString("INQUIRE_CONTENT")
						        , rset.getString("USER_ID")
						        , rset.getDate("CREATE_DATE")
						        , rset.getString("STATUS")
						        , rset.getString("ANSWER"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return inq;
	}

	public int deleteInquire(Connection conn, int inquireNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteInquire");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquireNo);
			
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
