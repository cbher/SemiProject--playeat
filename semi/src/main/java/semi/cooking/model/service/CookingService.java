package semi.cooking.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.common.PageInfo;
import semi.cooking.model.dao.CookingDao;
import semi.cooking.model.vo.Attachment;
import semi.cooking.model.vo.CookingBoard;

public class CookingService {
	
	public ArrayList<CookingBoard> selectCookingList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<CookingBoard> list = new CookingDao().selectCookingList(conn, pi);
		close(conn);
		return list;
		
		
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new CookingDao().selectListCount(conn);
		close(conn);
		return listCount;
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
		close(conn);
		return result1 * result2;
		
	}
	
	public int increaseCount(int cBoardNo) {
		Connection conn = getConnection();
		int result = new CookingDao().increaseCount(conn, cBoardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public CookingBoard selectCookBoard(int cookBoardNo) {
		Connection conn = getConnection();
		CookingBoard cookBoard = new CookingDao().selectCookBoard(conn, cookBoardNo);
		close(conn);
		return cookBoard;

	}
	
	public ArrayList<Attachment> selectAttachmentList(int cookBoardNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new CookingDao().selectAttachmentList(conn, cookBoardNo);
		close(conn);
		return list;
	}
	
	public int updateCookBoard(CookingBoard cBoard) {
		Connection conn = getConnection();
		int result = new CookingDao().updateCookBoard(conn, cBoard);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int deleteCookBoard(int cBoardNo) {
		Connection conn = getConnection();
		int result = new CookingDao().deleteCookBoard(conn, cBoardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
