package semi.member.model.service;

import java.sql.Connection;

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

	public Member kakaoLoginMember(String userId) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().kakaoLoginMember(conn, userId);
		
		close(conn);
		
		return m;
	}

	public int insertKakaoMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertKakaoMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member searchId(String name, String email) {
		Connection conn = getConnection();

		Member resultMember = new MemberDao().searchId(conn, name, email);
		close(conn);
		return resultMember;
	}

	public Member searchPwd(String userId, String name, String email) {
		Connection conn = getConnection();

		Member resultMember = new MemberDao().searchPwd(conn, userId, name, email);
		close(conn);
		return resultMember;
	}

	public int changePwd(String userId, String userPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().changePwd(conn, userId, userPwd);

	    if (result > 0) {
	      commit(conn);
	    } else {
	      rollback(conn);
	    }

	    close(conn);
	    return result;
	}

	public int incrementReportCount(int userNo, int reviewNo) {
		Connection conn = getConnection();
	    int result1 = new MemberDao().incrementReportCount(conn, userNo);
	    int result2 = new MemberDao().insertReport(conn, reviewNo, userNo);
	    
	    if (result1 > 0 && result2 > 0) {
	        commit(conn);
	    } else {
	        rollback(conn);
	    }
	    close(conn);
	    return result1 * result2;
	}

	public int incrementReportCount2(int userNo, int comNo) {
		Connection conn = getConnection();
	    int result1 = new MemberDao().incrementReportCount(conn, userNo);
	    int result2 = new MemberDao().insertReport2(conn, comNo, userNo);
	    
	    if (result1 > 0 && result2 > 0) {
	        commit(conn);
	    } else {
	        rollback(conn);
	    }
	    close(conn);
	    return result1 * result2;
	}


}
