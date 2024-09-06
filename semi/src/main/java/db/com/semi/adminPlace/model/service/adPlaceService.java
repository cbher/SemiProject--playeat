package db.com.semi.adminPlace.model.service;

import static semi.common.JDBCtemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import db.com.semi.adminPlace.model.dao.adPlaceDao;
import db.com.semi.adminPlace.model.vo.Attechment;
import db.com.semi.adminPlace.model.vo.Place;

public class adPlaceService {
	
	public ArrayList<Place> adPlaceList(String Pname) {
		
	Connection conn = getConnection();
	
	ArrayList<Place> list = new adPlaceDao().adPlaceList(conn,Pname);
	close(conn);
	return list;
	}
	
	
	public ArrayList<Place> adPlaceRestList(String Pname) {
		
	Connection conn = getConnection();
	
	ArrayList<Place> list = new adPlaceDao().adPlaceRestList(conn,Pname);
	close(conn);
	return list;

	}
	
	
	public ArrayList<Place> adPlacePlayList(String Pname) {
		
	Connection conn = getConnection();
	
	ArrayList<Place> list = new adPlaceDao().adPlacePlayList(conn,Pname);
	close(conn);
	return list;
	}
	
	public Place adplaceDetial(int qno) {
		
		Connection conn = getConnection();
		
		Place list = new adPlaceDao().adplaceDetial(conn ,qno);
		close(conn);
		return list;
	}
	
	public int insertPlace(Place p, ArrayList<Attechment> list) {
		Connection conn = getConnection();
		int result1 = new adPlaceDao().insertPlace(p,conn);
		int result2 = new adPlaceDao().insertPlaceat(list,conn);
		int result = result1*result2;
		if(result >0) {
			
			commit(conn);
		}else {
			
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	public ArrayList<Attechment> adplaceDetialat(int pno){
		Connection conn = getConnection();
		ArrayList<Attechment> list = new adPlaceDao().adplaceDetialat( pno, conn);
		close(conn);
		return list;
	}
	
	public int adPlaceDelete(int pno){
		Connection conn = getConnection();
		int result = new adPlaceDao().adPlaceDelete(pno, conn);
		if(result>0) {
			
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int adPlaceStop(int pno){
		Connection conn = getConnection();
		int result = new adPlaceDao().adPlaceStop(pno, conn);
		if(result>0) {
			
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int updatePlace(Place p, ArrayList<Attechment> list ,int pno) {
		Connection conn = getConnection();
		int result1 = new adPlaceDao().updatePlace(p,conn,pno);
		int result2 = new adPlaceDao().updatedeleteat(conn,pno);
		int result3 = new adPlaceDao().updatePlaceat(list,conn,pno);
		int result = result1*result2;
	
		if(result >0) {
			
			commit(conn);
		}else {
		
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

}
