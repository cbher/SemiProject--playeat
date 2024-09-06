package semi.ranking.model.service;

import static semi.common.JDBCtemplate.close;
import static semi.common.JDBCtemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import semi.cooking.model.vo.CookingBoard;
import semi.ranking.model.dao.RankingDao;
import semi.ranking.model.vo.Ranking;

public class RankingService {
	
    public ArrayList<Ranking> selectTop3() {
    	Connection conn = getConnection();
		ArrayList<Ranking> list = new RankingDao().selectTop3(conn);
		close(conn);
		return list;
    }
    
   
}
