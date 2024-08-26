package semi.oneday.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.common.PageInfo;
import semi.oneday.model.dao.OnedayDao;
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
	
}
