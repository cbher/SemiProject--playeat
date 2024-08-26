package db.com.semi.adBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import db.com.semi.adBoard.model.dao.AdBoardDao;
import db.com.semi.adBoard.model.vo.AdBoard;

import static semi.common.JDBCtemplate.*;

public class AdBoardService {

	
	public ArrayList<AdBoard> AdBoardList(String select) {
		Connection conn = getConnection();
		ArrayList<AdBoard> list = new AdBoardDao().AdBoardList(conn , select);
		close(conn);
		return list;
	}
	

	
}
