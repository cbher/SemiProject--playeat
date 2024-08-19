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

}
