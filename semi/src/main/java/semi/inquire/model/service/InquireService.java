package semi.inquire.model.service;

import static semi.common.JDBCtemplate.close;
import static semi.common.JDBCtemplate.commit;
import static semi.common.JDBCtemplate.getConnection;
import static semi.common.JDBCtemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.PageInfo;
import semi.inquire.model.dao.InquireDao;
import semi.inquire.model.vo.Inquire;


public class InquireService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new InquireDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}

	public ArrayList<Inquire> inquireSelectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Inquire> list = new InquireDao().inquireSelectList(conn, pi);
		
		if(!list.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return list;
	
	}

	

	
}
