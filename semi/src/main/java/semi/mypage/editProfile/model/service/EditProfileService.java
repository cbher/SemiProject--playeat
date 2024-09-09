package semi.mypage.editProfile.model.service;

import static semi.common.JDBCtemplate.*;
import static semi.common.JDBCtemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;
import semi.mypage.editInformation.model.vo.MemberInformation;
import semi.mypage.editProfile.model.dao.EditProfileDao;
import semi.mypage.editProfile.model.vo.Attachment;
import semi.mypage.editProfile.model.vo.EditProfile;

public class EditProfileService {
	
	
	
	 public ArrayList<EditProfile> myProfile(int userNo) {
	        Connection conn = getConnection();
	        ArrayList<EditProfile> list = new EditProfileDao().myProfile(conn, userNo);
	        close(conn);
	        return list;
	    }

	    // 프로필 수정 (사진 포함)
	    public int EditMyProfile(int userNo, String nickname, String introduce, ArrayList<Attachment> att) {
	        Connection conn = getConnection();
	        
	        int result1 = new EditProfileDao().EditMyProfile(conn, userNo, nickname, introduce); // 닉네임, 자기소개 수정
	        int result2 = 0;
	        
	        // 첨부 파일이 있는 경우만 프로필 사진을 업데이트 시킴
	        if (att != null && !att.isEmpty()) {
	            result2 = new EditProfileDao().EditMyProfileAttachment(conn, att, userNo);
	        }

	        // 1.닉네임, 자기소개가 수정되고 and 2(사진이 입력되지 않았거나 입력된 사진을 잘 적용했다면) commit시킴
	        if (result1 > 0 && (result2 > 0 || att == null)) {
	            commit(conn);
	        } else {
	            rollback(conn);
	        }

	        close(conn);
	        return result1 * result2;
	    }
	}