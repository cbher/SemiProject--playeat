package semi.mypage.myOneComment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.PageInfo;
import semi.mypage.myOneComment.model.dao.MyOneCommentDao;
import semi.mypage.myOneComment.model.vo.OneComment;
import static semi.common.JDBCtemplate.*;

public class MyOneCommentService {
	
	public int selectListCount(int userNo) {
        Connection conn = getConnection();
        int listCount = new MyOneCommentDao().getListCount(conn, userNo);
        close(conn);
        return listCount;
    }
	
	public ArrayList<OneComment> selectList(PageInfo pi, int userNo, String sort) {
	    Connection conn = getConnection();
	    ArrayList<OneComment> list = new MyOneCommentDao().oneCommentList(conn, pi, userNo, sort);
	    close(conn);
	    return list;
	}
	
	public int DeleteComment(int commentNo){
		Connection conn=getConnection();
		
		int result = new MyOneCommentDao().DeleteOneComment(conn,commentNo);
		close(conn);
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		return result;
		
	}
}
