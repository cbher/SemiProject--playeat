package db.com.semi.adminPlace.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import db.com.semi.adminPlace.model.vo.Place;

import static semi.common.JDBCtemplate.*;

public class adPlaceDao {
	
	private	Properties prop = new Properties(); 
	public  adPlaceDao() {
		try {
			prop.loadFromXML(new FileInputStream(adPlaceDao.class.getResource("/db/sql/adPlace-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Place> adPlaceList(Connection conn ,String Pname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adPlaceList");
		  if (Pname != null && !Pname.trim().isEmpty()) {
			    sql += "and p_title LIKE '%"+Pname+"%'";
	        }

	   
	        
		 ArrayList<Place> list = new ArrayList<Place>();
		try {
			pstmt = conn.prepareStatement(sql);
			
		
			// 검색어가 있는 경우 매개변수 바인딩
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Place(rset.getInt("p_no"), 
								   rset.getString("p_title"), 
								   rset.getString("address"), 
								   rset.getString("p_call"), 
								   rset.getString("p_status"), 
								   rset.getInt("tem_cate_no"), 
								   rset.getInt("p_score"),
								   rset.getInt("location_no"),
								   rset.getInt("p_select_num"), 
								   rset.getInt("rcategory_no")));
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
	}
	
	public ArrayList<Place> adPlaceRestList(Connection conn, String Pname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adPlaceRestList");
		  if (Pname != null && !Pname.trim().isEmpty()) {
	            sql += "and p_title LIKE '%"+Pname+"%'";
	        }
		 ArrayList<Place> list = new ArrayList<Place>();
		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Place(rset.getInt("p_no"), 
								   rset.getString("p_title"), 
								   rset.getString("address"), 
								   rset.getString("p_call"), 
								   rset.getString("p_status"), 
								   rset.getInt("tem_cate_no"), 
								   rset.getInt("p_score"),
								   rset.getInt("location_no"),
								   rset.getInt("p_select_num"), 
								   rset.getInt("rcategory_no")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
	}
	
	public ArrayList<Place> adPlacePlayList(Connection conn ,String Pname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adPlacePlayList");
		  if (Pname != null && !Pname.trim().isEmpty()) {
			    sql += "and p_title LIKE '%"+Pname+"%'";
	        }
		 ArrayList<Place> list = new ArrayList<Place>();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Place(rset.getInt("p_no"), 
								   rset.getString("p_title"), 
								   rset.getString("address"), 
								   rset.getString("p_call"), 
								   rset.getString("p_status"), 
								   rset.getInt("tem_cate_no"), 
								   rset.getInt("p_score"),
								   rset.getInt("location_no"),
								   rset.getInt("p_select_num"), 
								   rset.getInt("rcategory_no")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
	}
	

}
