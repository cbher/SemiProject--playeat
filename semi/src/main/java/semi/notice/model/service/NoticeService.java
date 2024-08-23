package semi.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.common.PageInfo;
import semi.notice.model.dao.NoticeDao;
import semi.notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> noticeSelectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().noticeSelectList(conn, pi);
		
		if(!list.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return list;
	}

	public int insertNotice(Notice n) {
	
		Connection conn = getConnection();
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result == 0) {
			rollback(conn);
		}else {
			commit(conn);
		}
		
		close(conn);
		return result;
	}

	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(noticeNo, conn);
		
		if(result != 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Notice noticeDetailView(int noticeNo) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().noticeDetailView(conn, noticeNo);
		
		close(conn);
		return n;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Notice noticeSelect(int noticeNo) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().noticeSelect(conn,noticeNo);
		
		close(conn);
		return n;
	}

	public int noticeDelete(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().noticeDelete(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}

	
	
	

}
