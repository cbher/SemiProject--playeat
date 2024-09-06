package db.com.semi.adBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import db.com.semi.adBoard.model.vo.AdBoard;
import db.com.semi.adBoard.model.vo.Attechment;

import static semi.common.JDBCtemplate.*;

public class AdBoardDao {
	
private	Properties prop = new Properties();
	public  AdBoardDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(AdBoardDao.class.getResource("/db/sql/adCookBoard-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<AdBoard> AdBoardList(Connection conn , String select) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
//		받아온 값에 따라 값 변경해보기
		String category = null;
		switch(select) {
		case "all" :
			category = "C_CATEGORY order by 1 desc";
			break;
		case "cook" :
			category = "1 order by 1 desc";
			break;
		case "honor" :
			category = "2 order by 1 desc";
			break;
		}
		String sql = prop.getProperty("AdBoardList");
		sql += category;
		ArrayList<AdBoard> list = new ArrayList<AdBoard>();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new AdBoard(rset.getInt("C_NO"),
						 rset.getString("C_TITLE"),
						 rset.getString("C_CONTENTS"),
						 rset.getDate("C_DATE"),
						 rset.getString("StaTUS"),
						 rset.getInt("C_STAR"),
						 rset.getInt("COUNT"),
						 rset.getString("USER_Name"),
						 rset.getInt("C_CATEGORY")
						 ));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
	}
	public AdBoard adBoardDetail(Connection conn, int bno) {
		AdBoard list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adBoardDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
			list = new AdBoard(rset.getInt("c_no"),
							   rset.getString("c_title"),
							   rset.getString("c_contents"),
							   rset.getDate("c_date"),
							   rset.getString("status"),
							   rset.getInt("c_star"),
							   rset.getInt("count"),
							   rset.getInt("user_no"),
							   rset.getInt("c_category"),
							   rset.getString("user_name")
							   );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
	}
				
	public ArrayList<Attechment> adBoardDetailat(Connection conn, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adBoardDetailat");
		ArrayList<Attechment> at = new ArrayList<Attechment>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				at.add(new Attechment(rset.getInt("file_no"),
									  rset.getString("origin_name"),
									  rset.getString("change_name"),
									  rset.getString("file_path"),
									  rset.getInt("file_level"),
									  rset.getInt("c_no")));	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return at;
		
	}
	
	public int adboarddelete(Connection conn, int bno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("adboarddelete");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}return result;
		
	}

}
