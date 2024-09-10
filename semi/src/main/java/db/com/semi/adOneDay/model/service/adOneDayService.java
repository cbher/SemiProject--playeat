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
		//�׳� �� �����ϰ� �����ұ�? ��� �������� all delete �ѵ� �ٽ� insert �ϱ�� ����
		
		//�ϴܻ����ϱ�
		int result2 = new adOneDayDao().adOnedayUpdateFileatDelete(conn,a);
		
		//���������� ���� �μ�Ʈ���ֱ�
		int result3 = new adOneDayDao().adOneDayUpdateFileinsert(conn,a,list);
		int result = result1*result2*result3;
		
		//�������� ���ư���� ������ ���� ������ �������� �ʰ��ִ� �����ϴ¹� �����
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
