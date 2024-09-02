package semi.search.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.oneday.model.vo.Oneday;
import semi.play.model.vo.Play;
import semi.search.model.dao.SearchDao;

public class SearchService {

	public ArrayList<Play> selectList(){
		Connection conn = getConnection();
		ArrayList<Play> list = new SearchDao().selectList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Play> selectLocationList(int category){
		Connection conn = getConnection();
		ArrayList<Play> list = new SearchDao().selectLocationList(conn, category);
		close(conn);
		return list;
	}
	
	public ArrayList<Play> searchRestaurant(int category){
		Connection conn = getConnection();
		ArrayList<Play> list = new SearchDao().searchRestaurant(conn, category);
		close(conn);
		return list;
	}
	
	public ArrayList<Play> selectAllRestaurant(){
		Connection conn = getConnection();
		ArrayList<Play> list = new SearchDao().selectAllRestaurant(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Play> searchPlay(int category){
		Connection conn = getConnection();
		ArrayList<Play> list = new SearchDao().searchPlay(conn, category);
		close(conn);
		return list;
	}
	
	public ArrayList<Play> searchAllPlay(){
		Connection conn = getConnection();
		ArrayList<Play> list = new SearchDao().searchAllPlay(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Oneday> searchAllOneday(){
		Connection conn = getConnection();
		ArrayList<Oneday> list = new SearchDao().searchAllOneday(conn);
		close(conn);
		return list;
	} 
	
	public ArrayList<Oneday> searchOneday(int category){
		Connection conn = getConnection();
		ArrayList<Oneday> list = new SearchDao().searchOneday(conn, category);
		close(conn);
		return list;
	}
}
