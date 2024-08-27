package semi.mypage.myOneComment.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.common.PageInfo;
import semi.mypage.myOneComment.model.vo.OneComment;
import semi.mypage.myReview.model.dao.MyReviewDao;
import static semi.common.JDBCtemplate.*;

public class MyOneCommentDao {

	private Properties prop = new Properties();
	
	public MyOneCommentDao() {
		try {
			prop.loadFromXML(new FileInputStream(MyReviewDao.class.getResource("/db/sql/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<OneComment> oneCommentList(Connection conn, PageInfo pi, int userNo){
		
		ArrayList<OneComment> list = new ArrayList<OneComment>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("oneCommentList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset=pstmt.executeQuery();
			
			
				while(rset.next()) {
					list.add(new OneComment(rset.getInt("com_no"),
											rset.getString("com_content"),
											rset.getInt("score"),
											rset.getDate("create_date"),
											rset.getString("status"),
											rset.getString("p_title")));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	
	
}
