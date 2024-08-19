package semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static semi.common.JDBCtemplate.*;

import semi.member.model.vo.Member;

public class MemberDao {
	
private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertMember(Connection conn, Member m) {
				int result = 0;
				
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("insertMember");
				
				try {
					pstmt = conn.prepareStatement(sql); // 미완성된 쿼리
					
					pstmt.setString(1, m.getUserId());
					pstmt.setString(2, m.getUserPwd());
					pstmt.setString(3, m.getUserName());
					pstmt.setString(4, m.getPhone());
					pstmt.setString(5, m.getEmail());
					pstmt.setString(6, m.getNickName());
					
					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				
				return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		// select문 => ResultSet (한개 숫자) => int
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

}
