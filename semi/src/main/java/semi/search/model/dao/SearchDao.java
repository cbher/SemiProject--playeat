package semi.search.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCtemplate.*;
import semi.play.model.vo.Play;

public class SearchDao {
	
	private Properties prop = new Properties();
	
	public SearchDao() {
		try {
			prop.loadFromXML(new FileInputStream(SearchDao.class.getResource("/db/sql/search-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Play> selectList(Connection conn){
		ArrayList<Play> list = new ArrayList<Play>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Play(rset.getInt("p_no"),
								  rset.getString("p_title"),
								  rset.getString("address"),
								  rset.getString("p_call"),
								  rset.getDouble("p_score"),
								  rset.getString("businesstime"),
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
	
	public ArrayList<Play> selectLocationList(Connection conn, int category){
		ArrayList<Play> list = new ArrayList<Play>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Play(rset.getInt("p_no"),
						  rset.getString("p_title"),
						  rset.getString("address"),
						  rset.getString("p_call"),
						  rset.getDouble("p_score"),
						  rset.getString("businesstime"),
						  rset.getString("titleimg")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<Play> searchRestaurant(Connection conn, int category){
		ArrayList<Play> list = new ArrayList<Play>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchRestaurant");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Play(rset.getInt("p_no"),
						  rset.getString("p_title"),
						  rset.getString("address"),
						  rset.getString("p_call"),
						  rset.getDouble("p_score"),
						  rset.getString("businesstime"),
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
	
	public ArrayList<Play> selectAllRestaurant(Connection conn){
		ArrayList<Play> list = new ArrayList<Play>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllRestaurant");
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Play(rset.getInt("p_no"),
						  rset.getString("p_title"),
						  rset.getString("address"),
						  rset.getString("p_call"),
						  rset.getDouble("p_score"),
						  rset.getString("businesstime"),
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
}





















