package db.com.semi.adminPlace.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;

import db.com.semi.adminPlace.model.vo.Attechment;
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
			  Collections.reverse(list);
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
			  Collections.reverse(list);
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
			  Collections.reverse(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
	}
	public Place adplaceDetial(Connection conn , int qno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adplaceDetial");
		Place list = null;
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
			 list = new Place(rset.getInt("P_no"),
								   rset.getString("P_TITLE"),
								   rset.getString("address"),
								   rset.getString("P_CALL"),
								   rset.getString("P_STATUS"),
								   rset.getString("tem_cate_name"),
								   rset.getInt("p_score"),
								   rset.getString("location_name"),
								   rset.getInt("p_select_num"),
								   rset.getString("businesstime"),
								   rset.getString("rcategory_name"),
								   rset.getInt("tem_cate_no"),
								   rset.getInt("location_no"),
								   rset.getInt("rcategory_no")
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
	
	public int insertPlace(Place p,Connection conn) {
		PreparedStatement pstmt=null;
		
		String sql = prop.getProperty("insertPlace");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getAddress());
			pstmt.setString(3, p.getpCall());
			pstmt.setInt(4, p.getTemCateNo());
			pstmt.setInt(5, p.getLocationNo());
			pstmt.setInt(6, p.getpSelectNum());
			pstmt.setInt(7, p.getRcategoryNo());
			pstmt.setString(8, p.getBusinesstime());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}
	
	public int insertPlaceat(ArrayList<Attechment> list, Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPlaceat");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			for(Attechment at : list) {
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
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
	public ArrayList<Attechment> adplaceDetialat(int qno , Connection conn){
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adplaceDetialat");
		ResultSet rset =null;
		ArrayList<Attechment> list = new ArrayList<Attechment>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Attechment(rset.getInt("file_no"),
										rset.getString("origin_name"),
										rset.getString("change_name"),
										rset.getString("file_path"),
										rset.getInt("file_level")));
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
	public int adPlaceDelete(int pno, Connection conn) {
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("adPlaceDelete");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}
	public int adPlaceStop(int pno, Connection conn) {
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("adPlaceStop");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	
	
	
	public int updatePlace(Place p,Connection conn,int pno) {
		PreparedStatement pstmt=null;
		
		String sql = prop.getProperty("updatePlace");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getAddress());
			pstmt.setString(3, p.getpCall());
			pstmt.setInt(4, p.getTemCateNo());
			pstmt.setInt(5, p.getLocationNo());
			pstmt.setInt(6, p.getpSelectNum());
			pstmt.setInt(7, p.getRcategoryNo());
			pstmt.setString(8, p.getBusinesstime());
			pstmt.setInt(9, pno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}
	public int updatedeleteat(Connection conn , int pno) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatedeleteat");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updatePlaceat(ArrayList<Attechment> list, Connection conn,int pno) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePlaceat");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(Attechment at : list) {
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				pstmt.setInt(5, pno);
			
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


}
