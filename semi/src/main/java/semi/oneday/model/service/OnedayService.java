package semi.oneday.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static semi.common.JDBCtemplate.*;

import semi.common.PageInfo;
import semi.cooking.model.vo.Attachment;
import semi.oneday.model.dao.OnedayDao;
import semi.oneday.model.vo.Comment;
import semi.oneday.model.vo.Oneday;

public class OnedayService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new OnedayDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Oneday> selectOnedayList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Oneday> list = new OnedayDao().selectOnedayList(pi,conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Oneday> selectPopulrList(){
		Connection conn = getConnection();
		ArrayList<Oneday> popularList = new OnedayDao().selectPopularList(conn);
		close(conn);
		return popularList;
	}

	public Oneday detailOneday(int oneNo) {
		Connection conn = getConnection();
		Oneday b = new OnedayDao().detailOneday(conn, oneNo);
		
		close(conn);
		return b;
	}

	public ArrayList<Attachment> DetailAttachmentList(int oneNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new OnedayDao().DetailAttachmentList(conn, oneNo);
				
		close(conn);
		return list;
	}

	public ArrayList<Comment> getCommentsByOneNo(int oneNo) {
	    Connection conn = getConnection();
	    ArrayList<Comment> commentList = new OnedayDao().selectCommentsByOneNo(conn, oneNo);
	    close(conn);
	    return commentList;
	}

	
}
