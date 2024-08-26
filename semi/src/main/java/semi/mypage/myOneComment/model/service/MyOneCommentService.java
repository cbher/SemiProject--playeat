package semi.mypage.myOneComment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.PageInfo;
import semi.mypage.myOneComment.model.dao.MyOneCommentDao;
import semi.mypage.myOneComment.model.vo.OneComment;
import static semi.common.JDBCtemplate.*;

public class MyOneCommentService {

	public ArrayList<OneComment> selectList(PageInfo pi, int userNo){
		Connection conn = getConnection();
		
		ArrayList<OneComment> list=new MyOneCommentDao().oneCommentList(conn, pi, userNo);
		close(conn);
		return list;
	}
	
}
