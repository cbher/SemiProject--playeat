package semi.cooking.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.cooking.model.dao.CookingDao;
import semi.cooking.model.vo.Attachment;
import semi.cooking.model.vo.CookingBoard;

public class CookingService {
	
	public ArrayList<CookingBoard> selectCookingList(){
		
		Connection conn = getConnection();
		ArrayList<CookingBoard> list = new CookingDao().selectCookingList(conn);
		close(conn);
		return list;
		
		
	}
	
	public int insertCookingBoard(CookingBoard c , ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new CookingDao().insertCookBoard(conn, c);
		int result2 = new CookingDao().insertAttachmentList(conn,list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2;
		
	}
	
	public CookingBoard selectCookBoardDetail(int cookBoardNo) {
		Connection conn = getConnection();
		CookingBoard cookBoard = new CookingDao().selectCookBoardDetail(conn, cookBoardNo);
		close(conn);
		return cookBoard;

	}
}
