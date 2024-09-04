package db.com.semi.adMainmenu.model.service;

import static semi.common.JDBCtemplate.*;

import java.sql.Connection;




import db.com.semi.adMainmenu.model.dao.adMainDao;
import db.com.semi.adMainmenu.model.vo.adMainlistnum;

public class adMainService {
	
	public adMainlistnum adoneList() {
		Connection conn = getConnection();
		adMainlistnum result = new adMainDao().adoneList(conn);
		
		close(conn);
		return result;
	
		
	}
	
	public adMainlistnum admemberList() {
		Connection conn = getConnection();
		adMainlistnum result = new adMainDao().admemberList(conn);
		
		close(conn);
		return result;

	}
	public adMainlistnum adreportList() {
		Connection conn = getConnection();
		adMainlistnum result = new adMainDao().adreportList(conn);
		
		close(conn);
		
		return result;

	}

	public adMainlistnum adquestionsList() {
		Connection conn = getConnection();
		adMainlistnum result = new adMainDao().adquestionsList(conn);
		
		close(conn);
		
		return result;

	}
}
