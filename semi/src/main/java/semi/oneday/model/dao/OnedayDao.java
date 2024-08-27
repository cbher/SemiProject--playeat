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

import semi.common.PageInfo;
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
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	public ArrayList<Oneday> selectOnedayList(PageInfo pi, Connection conn){
		ArrayList<Oneday> list = new ArrayList<Oneday>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOnedayList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Oneday(rset.getInt("one_no"),
									rset.getString("one_title"),
									rset.getString("one_place"),
									rset.getInt("ent_people"),
									rset.getDouble("score"),
									rset.getInt("price"),
									rset.getString("titleimg")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Oneday> selectPopularList(Connection conn){
		ArrayList<Oneday> popularList = new ArrayList<Oneday>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPopularList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				popularList.add(new Oneday(rset.getInt("one_no"),
									rset.getString("one_title"),
									rset.getDouble("score"),
									rset.getInt("price"),
									rset.getString("titleimg")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return popularList;
	}
	
}
