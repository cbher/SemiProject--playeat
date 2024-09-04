package db.com.semi.adMainmenu.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import db.com.semi.adMainmenu.model.vo.adMainlistnum;
import db.com.semi.adminPlace.model.vo.Attechment;
import db.com.semi.adminPlace.model.vo.Place;

import static semi.common.JDBCtemplate.*;

public class adMainDao {
	
	private	Properties prop = new Properties(); 
	public  adMainDao() {
		try {
			prop.loadFromXML(new FileInputStream(adMainDao.class.getResource("/db/sql/adMain-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public adMainlistnum adoneList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adoneList");
		adMainlistnum a = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				a= new adMainlistnum(rset.getInt("count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return a;
		
		
	}
	public adMainlistnum admemberList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("admemberList");
		adMainlistnum a = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				a= new adMainlistnum(rset.getInt("count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return a;
		
	}
	public adMainlistnum adreportList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adreportList");
		adMainlistnum a = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				a= new adMainlistnum(rset.getInt("count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return a;
		
	}
	public adMainlistnum adquestionsList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adquestionsList");
		adMainlistnum a = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				a= new adMainlistnum(rset.getInt("count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return a;
		
	}


}
