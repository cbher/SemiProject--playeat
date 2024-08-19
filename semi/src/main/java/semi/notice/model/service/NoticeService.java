package semi.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.notice.model.dao.NoticeDao;
import semi.notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> noticeSelectList() {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().noticeSelectList(conn);
		
		if(!list.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return list;
	}
	
	

}
