package db.com.semi.adOneDay.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import db.com.semi.adOneDay.model.dao.adOneDayDao;
import db.com.semi.adOneDay.model.vo.Attechment;
import db.com.semi.adOneDay.model.vo.adOneDayClass;


import static semi.common.JDBCtemplate.*;

public class adOneDayService {

	
	public ArrayList<adOneDayClass> adOnedayList() {
		
		Connection conn = getConnection();
		ArrayList<adOneDayClass> list = new adOneDayDao().adOnedayList(conn);
		close(conn);
		return list;
		
	}
	
	public ArrayList<adOneDayClass> adOnedayReadyList() {
		
		Connection conn = getConnection();
		ArrayList<adOneDayClass> list = new adOneDayDao().adOnedayReadyList(conn);
		close(conn);
		return list;
		
	}
	
	public ArrayList<adOneDayClass> adOnedayClearList() {
		
		Connection conn = getConnection();
		ArrayList<adOneDayClass> list = new adOneDayDao().adOnedayClearList(conn);
		close(conn);
		return list;
		
	}
	
	public ArrayList<adOneDayClass> adOnedayFailList() {
		
		Connection conn = getConnection();
		ArrayList<adOneDayClass> list = new adOneDayDao().adOnedayFailList(conn);
		close(conn);
		return list;
		
	}
	
	public adOneDayClass adOnedayDetail(int ano) {
		Connection conn = getConnection();
		adOneDayClass list = new adOneDayDao().adOnedayDetail(conn, ano);
		close(conn);
		return list;
	}
	
	public ArrayList<Attechment> adOnedayDetailat(int ano) {
		Connection conn = getConnection();
		 ArrayList<Attechment> at = new adOneDayDao().adOnedayDetailat(conn, ano);
		close(conn);
		return at;
	}
	public int adOneDayUpdateFile(adOneDayClass a, ArrayList<Attechment> list) {
		Connection conn = getConnection();
		int result1 = new adOneDayDao().adOnedayUpdateFile(conn,a);
		//그냥 다 삭제하고 새로할까? 라는 생각에서 all delete 한뒤 다시 insert 하기로 결정
		
		//일단삭제하기
		int result2 = new adOneDayDao().adOnedayUpdateFileatDelete(conn,a);
		
		//마지막으로 새로 인설트해주기
		int result3 = new adOneDayDao().adOneDayUpdateFileinsert(conn,a,list);
		int result = result1*result2*result3;
		
		//문제없이 돌아가고는 있지만 원본 파일은 삭제되지 않고있다 삭제하는법 물어보기
		if(result>0) {
			commit(conn);
	
		}else {
			rollback(conn);
	
		}
		close(conn);
		
		return result;
		
	}
	public int adOneDayDetele(int ono) {
		Connection conn = getConnection();
		int result = new adOneDayDao().adOneDayDetele(ono,conn);
		if (result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public int adonedayInsert(adOneDayClass a,ArrayList<Attechment> list) {
		Connection conn = getConnection();
		int result1 = new adOneDayDao().adOneDayinsertFile(a,conn);
		int result2 = new adOneDayDao().adOneDayinsertFile(list, conn);
		int result = result1*result2;
		if (result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		
		close(conn);
		return result;
	}
}
