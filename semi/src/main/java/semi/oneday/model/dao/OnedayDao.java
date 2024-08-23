package semi.oneday.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCtemplate.*;
import semi.oneday.model.vo.Oneday;

public class OnedayDao {
	private Properties prop = new Properties();
	
	public OnedayDao() {
		try {
			prop.loadFromXML(new FileInputStream(OnedayDao.class.getResource("/db/sql/oneday-mapper.xml").getPath()) );
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Oneday> selectOnedayList(Connection conn){
		ArrayList<Oneday> list = new ArrayList<Oneday>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOnedayList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Oneday(rset.getInt("one_no"),
									rset.getString("one_title"),
									rset.getString("one_place"),
									rset.getInt("ent_people"),
									rset.getDouble("score"),
									rset.getInt("price")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	
}
