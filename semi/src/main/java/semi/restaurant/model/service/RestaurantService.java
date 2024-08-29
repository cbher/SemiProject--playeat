package semi.restaurant.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.restaurant.model.dao.RestaurantDao;
import semi.restaurant.model.vo.Restaurant;

import static semi.common.JDBCtemplate.*;

public class RestaurantService {
	
	public ArrayList<ArrayList> selectRestaurantList(){
		Connection conn = getConnection();
		ArrayList<ArrayList> list = new RestaurantDao().selectRestaurantList(conn);
		close(conn);
		return list;
	}
	
	/** 
	 * 메인페이지에 쓰이는 레스토랑 리스트 이승헌 만듬
	 * @return
	 */
	public ArrayList<Restaurant> mainPageSelectRestaurnt(){
		
		Connection conn = getConnection();
		ArrayList<Restaurant> list = new RestaurantDao().mainPageSelectRestaurnt(conn);
		
		close(conn);
		return list;
	}
	 
	
	
	
}
