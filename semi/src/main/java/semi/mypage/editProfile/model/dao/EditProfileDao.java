package semi.mypage.editProfile.model.dao;

import static semi.common.JDBCtemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;
import semi.mypage.editInformation.model.vo.MemberInformation;
import semi.mypage.editProfile.model.vo.Attachment;
import semi.mypage.editProfile.model.vo.EditProfile;

public class EditProfileDao {

	
	
	 private Properties prop = new Properties();

	    public EditProfileDao() {
	        String filePath = MemberDao.class.getResource("/db/sql/mypage-mapper.xml").getPath();
	        try {
	            prop.loadFromXML(new FileInputStream(filePath));
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    public ArrayList<EditProfile> myProfile(Connection conn, int userNo) {
	        ArrayList<EditProfile> list = new ArrayList<>();
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;

	        String sql = prop.getProperty("MyProfile");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, userNo);
	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                list.add(new EditProfile(rset.getString("introduce"),
	                                         rset.getString("nickname"),
	                                         rset.getString("file_path"),
	                                         rset.getString("change_name")));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return list;
	    }

	    public int EditMyProfile(Connection conn, int userNo, String nickname, String introduce) {
	        int result = 0;
	        PreparedStatement pstmt = null;
	        String sql = prop.getProperty("UpdateProfile");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, nickname);
	            pstmt.setString(2, introduce);
	            pstmt.setInt(3, userNo);

	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(pstmt);
	        }

	        return result;
	    }

	    public int EditMyProfileAttachment(Connection conn, ArrayList<Attachment> attList, int userNo) {
	        int result = 0;
	        PreparedStatement pstmt = null;
	        String sql = prop.getProperty("UpdateProfileAttachment"); // 변경된 SQL 사용
	        
	        try {
	            for (Attachment att : attList) {
	                pstmt = conn.prepareStatement(sql);
	                pstmt.setString(1, att.getOriginName());
	                pstmt.setString(2, att.getChangeName());
	                pstmt.setString(3, att.getFilePath());
	                pstmt.setInt(4, userNo);
	                result = pstmt.executeUpdate();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(pstmt);
	        }
	        
	        return result;
	    }
	}