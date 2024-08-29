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
import semi.notice.model.vo.Attechment;


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

	public int insertInquire(Inquire inq, Attechment at) {
		Connection conn = getConnection();
		int result1 = new InquireDao().insertInquire(conn, inq);
		int result2 = 1;
		
		if(at != null) {
			result2 = new InquireDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
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

	public Attechment selectAttechment(int inquireNo) {
		Connection conn = getConnection();
		Attechment at = new InquireDao().selectAttechment(conn,inquireNo );
		
		close(conn);
		
		
		return at;
	}

	public Inquire checkEmail(int inquireNo) {
		Connection conn = getConnection();
		Inquire inq = new InquireDao().checkEmail(conn, inquireNo);
		
		close(conn);
		
		return inq;
	}

	
	

	
}
