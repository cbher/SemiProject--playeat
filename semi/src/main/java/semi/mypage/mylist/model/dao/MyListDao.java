package semi.mypage.mylist.model.dao;

import static semi.common.JDBCtemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.common.PageInfo;
import semi.mypage.mylist.model.vo.MyList;

public class MyListDao {
	
	private Properties prop = new Properties();
	
	public MyListDao() {
		try {
			prop.loadFromXML(new FileInputStream(MyListDao.class.getResource("/db/sql/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 찜 리스트 총 개수 조회
	public int getMyListCount(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getMyListCount"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 카테고리별 찜 리스트 개수 조회
	public int getMyListCountByCategory(Connection conn, int userNo, String category) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getMyListCountByCategory");  
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, category);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	// 찜 리스트 조회 + 정렬
	public ArrayList<MyList> selectMyListWithSorting(Connection conn, PageInfo pi, int userNo, String sortCriteria) {
		ArrayList<MyList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyListWithSorting"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, sortCriteria);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new MyList(rset.getInt("like_no"),
									rset.getString("one_title"),
									rset.getString("one_phone"),
									rset.getString("one_status"),
									rset.getString("tem_cate_name"),
									rset.getString("one_place"),
									rset.getDouble("score")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 카테고리 + 정렬된 찜 리스트 조회
	public ArrayList<MyList> selectMyListByCategoryWithSorting(Connection conn, PageInfo pi, int userNo, String category, String sortCriteria) {
		ArrayList<MyList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyListByCategoryWithSorting"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, category);
			pstmt.setString(3, sortCriteria);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new MyList(rset.getInt("like_no"),
									rset.getString("one_title"),
									rset.getString("one_phone"),
									rset.getString("one_status"),
									rset.getString("tem_cate_name"),
									rset.getString("one_place"),
									rset.getDouble("score")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 찜 리스트 항목 삭제
	public int deleteMyList(Connection conn, int likeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMyList");  
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}