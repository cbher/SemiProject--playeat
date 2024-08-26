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

	public int insertInquire(Inquire inq) {
		Connection conn = getConnection();
		int result = new InquireDao().insertInquire(conn, inq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Inquire detailViewInq(int inquireNo) {
		
		Connection conn = getConnection();
		
		Inquire inq = new InquireDao().detailViewInq(conn, inquireNo);
		
		close(conn);
		return inq;
	}

	public int deleteInquire(int inquireNo) {
		Connection conn = getConnection();
		int result = new InquireDao().deleteInquire(conn, inquireNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
	

	
}
