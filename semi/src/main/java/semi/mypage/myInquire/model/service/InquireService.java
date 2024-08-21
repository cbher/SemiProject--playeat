package semi.mypage.myInquire.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static semi.common.JDBCtemplate.*;



import semi.mypage.myInquire.model.dao.InquireDao;
import semi.mypage.myInquire.model.vo.Inquire;


public class InquireService {
	
	
	
	public ArrayList<Inquire> inquireList(int userNo){
		Connection conn =getConnection();
		
		ArrayList<Inquire> list = new InquireDao().inquireList(conn, userNo);
		
		
		close(conn);
		
		return list;
	}
	
	
	
	
}
