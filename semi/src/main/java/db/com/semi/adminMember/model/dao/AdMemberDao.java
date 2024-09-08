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
import db.com.semi.adminMember.model.vo.Attechment;
import db.com.semi.adminMember.model.vo.oneComment;
import db.com.semi.adminMember.model.vo.review;

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
	public Attechment adMemberDetailat(Connection conn , int Mno) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adMemberDetailat");
		ResultSet rset = null;
		Attechment list = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Mno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list = new Attechment(rset.getInt("file_no"),
									  rset.getString("origin_name"),
									  rset.getString("change_name"),
									  rset.getString("file_path"),
									  rset.getInt("file_level"))
						;
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
				System.out.println(rset.getInt("REPORT_NO"));
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
	
	public int adMemberreportbeen(int reportNo, Connection conn) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("adMemberreportbeen");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	public int adNoreport(Connection conn, int rnro) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("adNoreport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnro);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	

	
	
	
	
}
	
public review adreportReview(int reno, Connection conn){
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = prop.getProperty("adreportReview");
	review r = null;
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reno);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			r = new review(rset.getInt("review_no"), rset.getString("r_title"), rset.getString("r_content"), rset.getDate("r_date"), rset.getInt("play_no"));
			
		}
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}return r;
	
	
	
}
public Attechment adreportReviewat(int reno, Connection conn){
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = prop.getProperty("adreportReviewat");
	Attechment at = null;
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reno);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			at = new Attechment(rset.getInt("file_No"), rset.getString("origin_Name"), rset.getString("change_name"), rset.getString("file_path"), rset.getInt("file_Level"));
			
		}
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}return at;
	
	
	
}
public oneComment adreportoneComment(int ono, Connection conn){
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = prop.getProperty("adreportoneComment");
	oneComment r = null;
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ono);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			r = new oneComment(rset.getInt("com_no"),  rset.getString("com_content"), rset.getDate("create_date"));
			
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
