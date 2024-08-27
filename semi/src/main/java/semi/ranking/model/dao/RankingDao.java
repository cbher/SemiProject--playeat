package semi.ranking.model.dao;

import static semi.common.JDBCtemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.cooking.model.vo.CookingBoard;
import semi.ranking.model.vo.Ranking;


public class RankingDao {
	
private Properties prop = new Properties();

public RankingDao() {
	
	String filePath = RankingDao.class.getResource("/db/sql/ranking-mapper.xml").getPath();
	
	try {
		prop.loadFromXML(new FileInputStream(filePath));
	} catch (IOException e) {
		e.printStackTrace();
	}
	
}
	
	public ArrayList<Ranking> selectTop3(Connection conn) {
		ArrayList<Ranking> list = new ArrayList<Ranking>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTop3");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Ranking(rset.getInt("c_no"),
										  rset.getString("c_title"),
										  rset.getString("c_contents"),
										  rset.getDate("c_date"),
										  rset.getString("status"),
										  rset.getInt("c_star"),
										  rset.getInt("count"),
										  rset.getInt("user_no"),
										  rset.getInt("c_category"),
										  rset.getString("titleimg"),
										  rset.getString("user_name"),
										  rset.getString("nickname")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	

}
