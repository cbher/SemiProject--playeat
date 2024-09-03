package db.com.semi.adminMember.model.service;

import static semi.common.JDBCtemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import db.com.semi.adminMember.model.dao.AdMemberDao;
import db.com.semi.adminMember.model.vo.AdMember;
import db.com.semi.adminMember.model.vo.AdReport;

public class AdMemberService {
	
	public ArrayList<AdMember> adMemberList() {
	Connection conn = 	getConnection();
		ArrayList<AdMember> list = new AdMemberDao().adMemberList(conn);
		close(conn);
		return list;
	}
	public ArrayList<AdMember> adMemberDateList() {
	Connection conn = 	getConnection();
		ArrayList<AdMember> list = new AdMemberDao().adMemberDateList(conn);
		close(conn);
		return list;
	}
	public ArrayList<AdMember> adMemberReportList() {
	Connection conn = 	getConnection();
		ArrayList<AdMember> list = new AdMemberDao().adMemberReportList(conn);
		close(conn);
		return list;
	}
	public AdMember adMemberDetail(int Mno) {
	 Connection conn = 	getConnection();
	 AdMember list = new AdMemberDao().adMemberDetail(conn, Mno);
	 
	 close(conn);
	 return list;
	}
	
	public ArrayList<AdReport> adReportList() {
		Connection conn = getConnection();
		ArrayList<AdReport> list = new AdMemberDao().adReportList(conn);
		
		close(conn);
		return list;
	}
	
	public ArrayList<AdReport> adReportReadyList() {
		Connection conn = getConnection();
		ArrayList<AdReport> list = new AdMemberDao().adReportReadyList(conn);
		
		close(conn);
		return list;
	}

	
	public ArrayList<AdReport> adReportClearList() {
		Connection conn = getConnection();
		ArrayList<AdReport> list = new AdMemberDao().adReportClearList(conn);
		
		close(conn);
		return list;
	}
	public int adMemberbeen(int userNo) {
		Connection conn = getConnection();
		int result = new AdMemberDao().adMemberbeen( userNo, conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}return result;
		
	}
	
	
	public int adMemberbeenOff(int userNo) {
		Connection conn = getConnection();
		int result = new AdMemberDao().adMemberbeenOff( userNo, conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}return result;
		
	}
	public AdReport adReportDetail(int Rno){
		 Connection conn = getConnection();
		 AdReport list = new AdMemberDao().adReportDetail( Rno, conn);
		 
		 close(conn);
		 return list;
	}
	
	public int adMemberreportbeen(int reportNo) {
		Connection conn = getConnection();
		int result = new AdMemberDao().adMemberreportbeen( reportNo, conn);
		
		close(conn);
		return result;
		
	}

	
	

}
