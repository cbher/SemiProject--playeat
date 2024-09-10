package semi.mypage.editInformation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCtemplate.*;


import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;
import semi.mypage.editInformation.model.vo.MemberInformation;
import semi.mypage.myOneComment.model.vo.OneComment;



public class InformationEditDao {
	
	private Properties prop = new Properties();
		

	public InformationEditDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/mypage-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int updateMember(Connection conn, MemberInformation memberinformation, int userNo) {
        int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("Editinformation");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberinformation.getUserName());
            pstmt.setString(2, memberinformation.getUserPwd());
            pstmt.setString(3, memberinformation.getPhone());
            pstmt.setString(4, memberinformation.getEmail());
            pstmt.setInt(5, userNo);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
	
	
	
	public int DeleteMember(Connection conn, int userNo) {
        int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("deleteMember");
        
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
	public int checkNickname(Connection conn, String nickname) {
	    int result = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("nickNameCheck");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, nickname);
	        rset = pstmt.executeQuery();
	        if (rset.next()) {
	            result = rset.getInt("COUNT");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return result;
	}

}
