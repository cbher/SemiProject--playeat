package db.com.semi.adminPlace.model.service;

import static semi.common.JDBCtemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import db.com.semi.adminPlace.model.dao.adPlaceDao;
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

}
