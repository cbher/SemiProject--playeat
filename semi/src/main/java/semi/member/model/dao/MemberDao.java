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
					pstmt = conn.prepareStatement(sql); // 誘몄셿�꽦�맂 荑쇰━
					
					pstmt.setString(1, m.getUserId());
					pstmt.setString(2, m.getUserPwd());
					pstmt.setString(3, m.getUserName());
					pstmt.setString(4, m.getNickName());
					pstmt.setString(5, m.getPhone());
					pstmt.setString(6, m.getEmail());
					
					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				
				return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		// select臾� => ResultSet (�븳媛� �닽�옄) => int
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

	public int nickNameCheck(Connection conn, String checkNickname) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nickNameCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkNickname);
			
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


	public Member loginMember(Connection conn, String userId, String userPwd) {
		// select臾� => ResultSet 媛앹껜 (�븳�뻾) => Member 媛앹껜
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql); // 誘몄셿�꽦�맂 sql臾�
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery(); // 議고쉶�맂 寃곌낵媛� �엳�떎硫� �븳�뻾 | 議고쉶�룉 寃곌낵媛� �뾾�떎硫� �븘臾닿쾬�룄 �븞�떞源�
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
						       rset.getString("user_id"),
						       rset.getString("user_pwd"),
						       rset.getString("user_name"),
						       rset.getString("nickname"),
						       rset.getString("phone"),
						       rset.getString("email"),
						       rset.getDate("enrolle_date"),
						       rset.getString("status"),
						       rset.getString("introduce"),
						       rset.getInt("report_count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public Member kakaoLoginMember(Connection conn, String userId) {
Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("kakaoLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
					       rset.getString("user_id"),
					       rset.getString("user_pwd"),
					       rset.getString("user_name"),
					       rset.getString("nickname"),
					       rset.getString("phone"),
					       rset.getString("email"),
					       rset.getDate("enrolle_date"),
					       rset.getString("status"),
					       rset.getString("introduce"),
					       rset.getInt("report_count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int insertKakaoMember(Connection conn, Member m) {
int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getNickName());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member searchId(Connection conn, String name, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchId");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
					       rset.getString("user_id"),
					       rset.getString("user_pwd"),
					       rset.getString("user_name"),
					       rset.getString("nickname"),
					       rset.getString("phone"),
					       rset.getString("email"),
					       rset.getDate("enrolle_date"),
					       rset.getString("status"),
					       rset.getString("introduce"),
					       rset.getInt("report_count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);		
			close(pstmt);
		}
		return m;
	}

	public Member searchPwd(Connection conn, String userId, String name, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchPwd");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
         
         rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no"),
					       rset.getString("user_id"),
					       rset.getString("user_pwd"),
					       rset.getString("user_name"),
					       rset.getString("nickname"),
					       rset.getString("phone"),
					       rset.getString("email"),
					       rset.getDate("enrolle_date"),
					       rset.getString("status"),
					       rset.getString("introduce"),
					       rset.getInt("report_count"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);		
			close(pstmt);
		}
		return m;
	}

	public int changePwd(Connection conn, String userId, String userPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("changePwd");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int incrementReportCount(Connection conn, int userNo) {
		int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("incrementReportCount");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, userNo);
	        result = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }
	    
	    return result;
	}

	public int insertReport(Connection conn, int reviewNo, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			pstmt.setInt(2, userNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertReport2(Connection conn, int comNo, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comNo);
			pstmt.setInt(2, userNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	

}
