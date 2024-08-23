package semi.oneday.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.oneday.model.dao.OnedayDao;
import semi.oneday.model.vo.Oneday;

public class OnedayService {
	
	public ArrayList<Oneday> selectOnedayList(){
		Connection conn = getConnection();
		ArrayList<Oneday> list = new OnedayDao().selectOnedayList(conn);
		close(conn);
		return list;
	}
	
}
