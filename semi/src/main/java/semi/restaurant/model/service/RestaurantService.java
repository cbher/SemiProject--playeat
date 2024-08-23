package semi.restaurant.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.restaurant.model.dao.RestaurantDao;

import static semi.common.JDBCtemplate.*;

public class RestaurantService {
	
	public ArrayList<ArrayList> selectRestaurantList(){
		Connection conn = getConnection();
		ArrayList<ArrayList> list = new RestaurantDao().selectRestaurantList(conn);
		close(conn);
		return list;
	}
}
