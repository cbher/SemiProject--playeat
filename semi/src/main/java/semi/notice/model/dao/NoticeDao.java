package semi.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCtemplate.*;
import semi.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop =new Properties();
	
	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(Notice.class.getResource("/db/sql/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Notice> noticeSelectList(Connection conn) {
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeSelectList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no")
						           , rset.getString("notice_title")
						           , rset.getString("user_id")
						           , rset.getInt("count")
						           , rset.getDate("create_date")
						           ));
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
