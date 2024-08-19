package semi.cooking.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.cooking.model.vo.CookingBoard;

public class CookingDao {
	
	private Properties prop = new Properties();
	
	public CookingDao() {
		try {
			prop.loadFromXML(new FileInputStream(CookingDao.class.getResource("/db/sql/cooking-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CookingBoard> selectCookingList(Connection conn){
		ArrayList<CookingBoard> list = new ArrayList<CookingBoard>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCookingList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
