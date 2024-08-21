package db.com.semi.adminMember.model.service;

import static semi.common.JDBCtemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import db.com.semi.adminMember.model.dao.AdMemberDao;
import db.com.semi.adminMember.model.vo.AdMember;

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
	

}
