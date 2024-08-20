package com.mypage.myInquire.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.common.JDBCtemplate.*;



import com.mypage.myInquire.model.dao.InquireDao;
import com.mypage.myInquire.model.vo.Inquire;


public class InquireService {
	
	
	
	public ArrayList<Inquire> inquireList(int userNo){
		Connection conn =getConnection();
		
		ArrayList<Inquire> list = new InquireDao().inquireList(conn, userNo);
		
		
		close(conn);
		
		return list;
	}
	
	
	
	
}
