package semi.member.model.service;

import java.sql.Connection;

import static semi.common.JDBCtemplate.*;

import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(userId, userPwd, conn); 
		
		close(conn);
		
		
		return m;
	}

}
