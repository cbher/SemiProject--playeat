package db.com.semi.adOneDay.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import db.com.semi.adOneDay.model.vo.Attechment;
import db.com.semi.adOneDay.model.vo.adOneDayClass;


import static semi.common.JDBCtemplate.*;

public class adOneDayDao {
	
	
	Properties prop = new Properties();
	
	public adOneDayDao() {
		
	try {
		prop.loadFromXML(new FileInputStream(adOneDayDao.class.getResource("/db/sql/adOneDayClass-mapper.xml").getPath()));
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}
	public ArrayList<adOneDayClass> adOnedayList(Connection conn){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adOnedayList");
	
		ArrayList<adOneDayClass> list = new ArrayList<adOneDayClass>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			 list.add(new adOneDayClass(rset.getInt("one_no"),
					 					rset.getString("one_title"),
					 					rset.getString("one_phone"),
					 					rset.getString("one_place"),
					 					rset.getString("one_status"),
					 					rset.getInt("location_no"),
					 					rset.getString("one_agree"),
					 					rset.getInt("ent_people"),
					 					rset.getString("tem_cate_name"),
					 					rset.getString("onecategory_name"),
					 					rset.getInt("score"),
					 					rset.getInt("price"),
					 					 rset.getString("start_time"),
					 					rset.getString("end_time")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
	
		
		
	
	}
	
	public ArrayList<adOneDayClass> adOnedayReadyList(Connection conn){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adOnedayReadyList");
		
		ArrayList<adOneDayClass> list = new ArrayList<adOneDayClass>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new adOneDayClass(rset.getInt("one_no"),
						rset.getString("one_title"),
						rset.getString("one_phone"),
						rset.getString("one_place"),
						rset.getString("one_status"),
						rset.getInt("location_no"),
						rset.getString("one_agree"),
						rset.getInt("ent_people"),
						rset.getString("tem_cate_name"),
						rset.getString("onecategory_name"),
						rset.getInt("score"),
						rset.getInt("price"),
						rset.getString("start_time"),
						rset.getString("end_time")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
		
		
		
	}
	
	public ArrayList<adOneDayClass> adOnedayClearList(Connection conn){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adOnedayClearList");
		
		ArrayList<adOneDayClass> list = new ArrayList<adOneDayClass>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new adOneDayClass(rset.getInt("one_no"),
						rset.getString("one_title"),
						rset.getString("one_phone"),
						rset.getString("one_place"),
						rset.getString("one_status"),
						rset.getInt("location_no"),
						rset.getString("one_agree"),
						rset.getInt("ent_people"),
						rset.getString("tem_cate_name"),
						rset.getString("onecategory_name"),
						rset.getInt("score"),
						rset.getInt("price"),
						rset.getString("start_time"),
						rset.getString("end_time")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
		
		
		
	}
	
	public ArrayList<adOneDayClass> adOnedayFailList(Connection conn){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adOnedayFailList");
		
		ArrayList<adOneDayClass> list = new ArrayList<adOneDayClass>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new adOneDayClass(rset.getInt("one_no"),
						rset.getString("one_title"),
						rset.getString("one_phone"),
						rset.getString("one_place"),
						rset.getString("one_status"),
						rset.getInt("location_no"),
						rset.getString("one_agree"),
						rset.getInt("ent_people"),
						rset.getString("tem_cate_name"),
						rset.getString("onecategory_name"),
						rset.getInt("score"),
						rset.getInt("price"),
						rset.getString("start_time"),
						rset.getString("end_time")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
		
		
		
	}
	public adOneDayClass adOnedayDetail(Connection conn, int ano) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adOnedayDetail");
		adOneDayClass list = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list = new adOneDayClass(rset.getInt("one_no"),
						rset.getString("one_title"),
						rset.getString("one_phone"),
						rset.getString("one_place"),
						rset.getString("one_status"),
						rset.getInt("location_no"),
						rset.getString("one_agree"),
						rset.getInt("ent_people"),
						rset.getString("tem_cate_name"),
						rset.getString("onecategory_name"),
						rset.getInt("score"),
						rset.getInt("price"),
						rset.getString("start_time"),
						rset.getString("end_time"),
						rset.getInt("tem_cate_no"),
						rset.getInt("onecategory_no"),
						rset.getString("location_name")
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
	
	public ArrayList<Attechment> adOnedayDetailat(Connection conn, int ano) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adOnedayDetailat");
		ArrayList<Attechment> at = new ArrayList<Attechment>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				at.add(new Attechment(rset.getInt("file_no"),
									  rset.getString("origin_name"),
									  rset.getString("change_name"),
									  rset.getString("file_path"),
									  rset.getInt("file_level"),
									  rset.getInt("one_no")))
						;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return at;
		
	}
	public int adOnedayUpdateFile(Connection conn, adOneDayClass a) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adOnedayUpdateFile");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a.getLocationNo());
			pstmt.setString(2, a.getOneTitle());
			pstmt.setInt(3, a.getEntPeople());
			pstmt.setInt(4, a.getTemCateNo());
			pstmt.setInt(5, a.getOnecategoryNo());
			pstmt.setInt(6, a.getPrice());
			pstmt.setString(7, a.getOnePlace());
			pstmt.setString(8, a.getStartTime());
			pstmt.setString(9, a.getEndTime());
			pstmt.setInt(10, a.getOneNo());
			result = pstmt.executeUpdate();
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int adOnedayUpdateFileatDelete(Connection conn, adOneDayClass a) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adOnedayUpdateFileatDelete");

		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a.getOneNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		
	}finally {
		
		close(pstmt);
	}
	return result;
	}
	
	public int adOneDayUpdateFileinsert(Connection conn, adOneDayClass a,ArrayList<Attechment> list) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adOneDayUpdateFileinsert");
	
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(Attechment at : list) {
				pstmt.setString(1,at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				pstmt.setInt(5, a.getOneNo());
				result = pstmt.executeUpdate();
			
			}
	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
		}finally {
			
			close(pstmt);
		}
		return result;
	}
	public int adOneDayDetele(int ono, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("adOneDayDetele");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ono);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(conn);
		}
		System.out.println(result);
		return result;
	}
	public int adOneDayinsertFile(adOneDayClass a ,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("adOneDayinsertFile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getOneTitle());
			pstmt.setString(2, a.getPhone());
			pstmt.setString(3, a.getOnePlace());
			pstmt.setInt(4, a.getLocationNo());
			pstmt.setInt(5, a.getEntPeople());
			pstmt.setInt(6, a.getTemCateNo());
			pstmt.setInt(7, a.getOnecategoryNo());
			pstmt.setInt(8, a.getPrice());
			pstmt.setString(9, a.getStartTime());
			pstmt.setString(10, a.getEndTime());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		

		
	}
	public int adOneDayinsertFile(ArrayList<Attechment> list ,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
	
		String sql = prop.getProperty("adOneDayinsertFileat");
		try {
			for(Attechment a : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setString(3, a.getFilePath());
				pstmt.setInt(4, a.getFileLevel());
			
				result = pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
		
	}
	
	
}
