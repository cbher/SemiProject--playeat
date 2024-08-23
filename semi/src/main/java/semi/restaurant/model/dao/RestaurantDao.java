package semi.restaurant.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCtemplate.*;
import semi.restaurant.model.vo.Restaurant;

public class RestaurantDao {
	
	private Properties prop = new Properties();
	
	public RestaurantDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(RestaurantDao.class.getResource("/db/sql/restaurant-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ArrayList> selectRestaurantList(Connection conn){
		ArrayList<ArrayList> list = new ArrayList<ArrayList>();
		ArrayList<Restaurant> listSeoul = new ArrayList<Restaurant>();
		ArrayList<Restaurant> listGyunggi = new ArrayList<Restaurant>();
		ArrayList<Restaurant> listIncheon = new ArrayList<Restaurant>();
		ArrayList<Restaurant> listKangwon = new ArrayList<Restaurant>();
		ArrayList<Restaurant> listChoongchung = new ArrayList<Restaurant>();
		ArrayList<Restaurant> listGyungsang = new ArrayList<Restaurant>();
		ArrayList<Restaurant> listJulla = new ArrayList<Restaurant>();
		ArrayList<Restaurant> listJeju = new ArrayList<Restaurant>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRestaurantList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, 1);
			pstmt.setInt(4, 1);
			pstmt.setInt(5, 1);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listSeoul.add(new Restaurant(rset.getInt("p_no"),
							  				 rset.getString("p_title"),
							  				 rset.getString("address"),
							  				 rset.getString("p_call"),
							  				 rset.getDouble("p_score"),
							  				 rset.getString("titleimg")));
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 2);
			pstmt.setInt(2, 2);
			pstmt.setInt(3, 2);
			pstmt.setInt(4, 2);
			pstmt.setInt(5, 2);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listGyunggi.add(new Restaurant(rset.getInt("p_no"),
							  				 rset.getString("p_title"),
							  				 rset.getString("address"),
							  				 rset.getString("p_call"),
							  				 rset.getDouble("p_score"),
							  				 rset.getString("titleimg")));
			
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 3);
			pstmt.setInt(2, 3);
			pstmt.setInt(3, 3);
			pstmt.setInt(4, 3);
			pstmt.setInt(5, 3);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listIncheon.add(new Restaurant(rset.getInt("p_no"),
							  				 rset.getString("p_title"),
							  				 rset.getString("address"),
							  				 rset.getString("p_call"),
							  				 rset.getDouble("p_score"),
							  				 rset.getString("titleimg")));
			
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 4);
			pstmt.setInt(2, 6);
			pstmt.setInt(3, 15);
			pstmt.setInt(4, 16);
			pstmt.setInt(5, 8);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listGyungsang.add(new Restaurant(rset.getInt("p_no"),
							  				 rset.getString("p_title"),
							  				 rset.getString("address"),
							  				 rset.getString("p_call"),
							  				 rset.getDouble("p_score"),
							  				 rset.getString("titleimg")));
			
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 7);
			pstmt.setInt(2, 9);
			pstmt.setInt(3, 11);
			pstmt.setInt(4, 12);
			pstmt.setInt(5, 7);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listChoongchung.add(new Restaurant(rset.getInt("p_no"),
							  				 rset.getString("p_title"),
							  				 rset.getString("address"),
							  				 rset.getString("p_call"),
							  				 rset.getDouble("p_score"),
							  				 rset.getString("titleimg")));
			
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 5);
			pstmt.setInt(2, 13);
			pstmt.setInt(3, 14);
			pstmt.setInt(4, 13);
			pstmt.setInt(5, 14);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listJulla.add(new Restaurant(rset.getInt("p_no"),
							  				 rset.getString("p_title"),
							  				 rset.getString("address"),
							  				 rset.getString("p_call"),
							  				 rset.getDouble("p_score"),
							  				 rset.getString("titleimg")));
			
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 10);
			pstmt.setInt(2, 10);
			pstmt.setInt(3, 10);
			pstmt.setInt(4, 10);
			pstmt.setInt(5, 10);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listKangwon.add(new Restaurant(rset.getInt("p_no"),
							  				 rset.getString("p_title"),
							  				 rset.getString("address"),
							  				 rset.getString("p_call"),
							  				 rset.getDouble("p_score"),
							  				 rset.getString("titleimg")));
			
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 17);
			pstmt.setInt(2, 17);
			pstmt.setInt(3, 17);
			pstmt.setInt(4, 17);
			pstmt.setInt(5, 17);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listJeju.add(new Restaurant(rset.getInt("p_no"),
							  				 rset.getString("p_title"),
							  				 rset.getString("address"),
							  				 rset.getString("p_call"),
							  				 rset.getDouble("p_score"),
							  				 rset.getString("titleimg")));
			
			}
			
			list.add(listSeoul);
			list.add(listGyunggi);
			list.add(listIncheon);
			list.add(listKangwon);
			list.add(listChoongchung);
			list.add(listJulla);
			list.add(listGyungsang);
			list.add(listJeju);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}
}
