package db.com.semi.adBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import db.com.semi.adBoard.model.dao.AdBoardDao;
import db.com.semi.adBoard.model.vo.AdBoard;
import db.com.semi.adBoard.model.vo.Attechment;

import static semi.common.JDBCtemplate.*;

public class AdBoardService {

	
	public ArrayList<AdBoard> AdBoardList(String select) {
		Connection conn = getConnection();
		ArrayList<AdBoard> list = new AdBoardDao().AdBoardList(conn , select);
		close(conn);
		return list;
	}
	
	
	public AdBoard adBoardDetail(int bno) {
		Connection conn = getConnection();
		AdBoard list = new AdBoardDao().adBoardDetail(conn, bno);
		close(conn);
		return list;

	}
	
	
	public ArrayList<Attechment> adBoardDetailat(int bno) {
		Connection conn = getConnection();

		ArrayList<Attechment> at = new AdBoardDao().adBoardDetailat(conn,bno);
		close(conn);
		return at;
	}
	
	public int adboarddelete(int bno) {
		Connection conn = getConnection();
		
		int result = new AdBoardDao().adboarddelete(conn,bno);
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
}
