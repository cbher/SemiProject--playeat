package db.com.semi.adminMember.model.service;

import static semi.common.JDBCtemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import db.com.semi.adminMember.model.dao.AdMemberDao;
import db.com.semi.adminMember.model.vo.AdMember;
import db.com.semi.adminMember.model.vo.AdReport;
import db.com.semi.adminMember.model.vo.Attechment;
import db.com.semi.adminMember.model.vo.oneComment;
import db.com.semi.adminMember.model.vo.review;

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
	public Attechment adMemberDetailat(int Mno) {
		Connection conn = 	getConnection();
		Attechment at = new AdMemberDao().adMemberDetailat(conn, Mno);
		
		close(conn);
		return at;
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
		}
		close(conn);
		return result;
		
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
	public int adNoreport( int rnro) {
		Connection conn = getConnection();
		
		int result = new AdMemberDao().adNoreport( conn,  rnro);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	
	public review adreportReview(int reno){
		Connection conn = getConnection();
		review list = new AdMemberDao().adreportReview( reno, conn);
		
		close(conn);
		return list;
	}
	
	public Attechment adreportReviewat(int reno){
		Connection conn = getConnection();
		Attechment at = new AdMemberDao().adreportReviewat( reno, conn);
		
		close(conn);
		return at;
	}
	
	
	public oneComment adreportoneComment(int ono){
		Connection conn = getConnection();
		oneComment list = new AdMemberDao().adreportoneComment(ono, conn);
		
		close(conn);
		return list;
	}
	

}
