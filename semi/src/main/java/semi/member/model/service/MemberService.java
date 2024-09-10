package semi.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;
import static semi.common.JDBCtemplate.*;

public class MemberService {
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		close(conn);
		return count;
	}
	
	public int nickNameCheck(String checkNickname) {
		Connection conn = getConnection();
		int count = new MemberDao().nickNameCheck(conn, checkNickname);
		close(conn);
		return count;
	}
	
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
		
	}
	

}
