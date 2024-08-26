package db.com.semi.adBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import db.com.semi.adBoard.model.vo.AdBoard;

import static semi.common.JDBCtemplate.*;

public class AdBoardDao {
	
private	Properties prop = new Properties();
	public  AdBoardDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(AdBoardDao.class.getResource("/db/sql/adCookBoard-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<AdBoard> AdBoardList(Connection conn , String select) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
//		받아온 값에 따라 값 변경해보기
		String category = null;
		switch(select) {
		case "all" :
			category = "C_CATEGORY";
			break;
		case "cook" :
			category = "1";
			break;
		case "honor" :
			category = "2";
			break;
		}
		String sql = prop.getProperty("AdBoardList");
		sql += category;
		ArrayList<AdBoard> list = new ArrayList<AdBoard>();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new AdBoard(rset.getInt("C_NO"),
						 rset.getString("C_TITLE"),
						 rset.getString("C_CONTENTS"),
						 rset.getDate("C_DATE"),
						 rset.getString("StaTUS"),
						 rset.getInt("C_STAR"),
						 rset.getInt("COUNT"),
						 rset.getString("USER_Name"),
						 rset.getInt("C_CATEGORY")
						 ));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
		
		
	}

}
