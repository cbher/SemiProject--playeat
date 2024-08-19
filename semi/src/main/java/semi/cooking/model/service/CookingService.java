package semi.cooking.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.cooking.model.dao.CookingDao;
import semi.cooking.model.vo.CookingBoard;

public class CookingService {
	
	public ArrayList<CookingBoard> selectCookingList(){
		
		Connection conn = getConnection();
		ArrayList<CookingBoard> list = new CookingDao().selectCookingList(conn);
		close(conn);
		return list;
		
		
	}
}
