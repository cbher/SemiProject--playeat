package db.com.semi.adminMember.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import db.com.semi.adminMember.model.vo.AdMember;
import db.com.semi.adminMember.model.vo.AdReport;

import static semi.common.JDBCtemplate.*;

public class AdMemberDao {
	
	private Properties prop = new Properties();
	
	public AdMemberDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(AdMemberDao.class.getResource("/db/sql/adMember-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<AdMember> adMemberList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adMemberList");

		ArrayList<AdMember> list = new ArrayList<AdMember>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new AdMember(rset.getInt("user_no"),
									  rset.getString("user_id"),
									  rset.getString("user_pwd"),
									  rset.getString("user_name"),
									  rset.getString("nickname"),
									  rset.getString("phone"),
									  rset.getString("email"),
									  rset.getDate("enrolle_date"),
									  rset.getString("status"),
									  rset.getString("introduce"),
									  rset.getInt("report_count")
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
	public ArrayList<AdMember> adMemberDateList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adMemberDateList");

		ArrayList<AdMember> list = new ArrayList<AdMember>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new AdMember(rset.getInt("user_no"),
									  rset.getString("user_id"),
									  rset.getString("user_pwd"),
									  rset.getString("user_name"),
									  rset.getString("nickname"),
									  rset.getString("phone"),
									  rset.getString("email"),
									  rset.getDate("enrolle_date"),
									  rset.getString("status"),
									  rset.getString("introduce"),
									  rset.getInt("report_count")
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
	public ArrayList<AdMember> adMemberReportList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adMemberReportList");

		ArrayList<AdMember> list = new ArrayList<AdMember>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new AdMember(rset.getInt("user_no"),
									  rset.getString("user_id"),
									  rset.getString("user_pwd"),
									  rset.getString("user_name"),
									  rset.getString("nickname"),
									  rset.getString("phone"),
									  rset.getString("email"),
									  rset.getDate("enrolle_date"),
									  rset.getString("status"),
									  rset.getString("introduce"),
									  rset.getInt("report_count")
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
	public AdMember adMemberDetail(Connection conn , int Mno) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adMemberDetail");
		ResultSet rset = null;
		AdMember list = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Mno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list = new AdMember(rset.getInt("user_no"),
									rset.getString("user_id"),
									rset.getString("user_pwd"),
									rset.getString("user_name"),
									rset.getString("nickname"),
									rset.getString("phone"),
									rset.getString("email"),
									rset.getDate("enrolle_date"),
									rset.getString("status"),
									rset.getString("introduce"),
									rset.getInt("report_count")
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
	
	
	public ArrayList<AdReport> adReportList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adReportList");
		ArrayList<AdReport> list = new ArrayList<AdReport>();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					list.add(new AdReport(rset.getInt("REPORT_NO"),
										  rset.getString("report_content"),
										  rset.getString("report_status"),
										  rset.getInt("review_no"),
										  rset.getInt("p_no"),
										  rset.getInt("pcom_no"),
										  rset.getInt("one_no"),
										  rset.getInt("ocom_no"),
										  rset.getInt("c_no"),
										  rset.getInt("user_no"),
										  rset.getString("user_name"),
										  rset.getDate("create_report")
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
	
	
	public ArrayList<AdReport> adReportReadyList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adReportReadyList");
		ArrayList<AdReport> list = new ArrayList<AdReport>();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					list.add(new AdReport(rset.getInt("REPORT_NO"),
										  rset.getString("report_content"),
										  rset.getString("report_status"),
										  rset.getInt("review_no"),
										  rset.getInt("p_no"),
										  rset.getInt("pcom_no"),
										  rset.getInt("one_no"),
										  rset.getInt("ocom_no"),
										  rset.getInt("c_no"),
										  rset.getInt("user_no"),
										  rset.getString("user_name"),
										  rset.getDate("create_report")
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
	
	
	public ArrayList<AdReport> adReportClearList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adReportClearList");
		ArrayList<AdReport> list = new ArrayList<AdReport>();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					list.add(new AdReport(rset.getInt("REPORT_NO"),
										  rset.getString("report_content"),
										  rset.getString("report_status"),
										  rset.getInt("review_no"),
										  rset.getInt("p_no"),
										  rset.getInt("pcom_no"),
										  rset.getInt("one_no"),
										  rset.getInt("ocom_no"),
										  rset.getInt("c_no"),
										  rset.getInt("user_no"),
										  rset.getString("user_name"),
										  rset.getDate("create_report")
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
	public int adMemberbeen( int userNo, Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adMemberbeen");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}

	
	public int adMemberbeenOff( int userNo, Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adMemberbeenOff");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	public AdReport adReportDetail(int Rno, Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adReportDetail");
		AdReport r = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Rno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				r = new AdReport(rset.getInt("REPORT_NO"),
								 rset.getString("REPORT_CONTENT"),
								 rset.getString("REPORT_STATUS"),
								 rset.getInt("review_no"),
								 rset.getInt("p_no"),
								 rset.getInt("pcom_no"),
								 rset.getInt("one_no"),
								 rset.getInt("ocom_no"),
								 rset.getInt("c_no"),
								 rset.getInt("user_no"),
								 rset.getString("user_name"),
								 rset.getDate("create_report"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return r;
		
		
		
	}

	
	
	
	
}
