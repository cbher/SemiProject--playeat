package semi.mypage.editInformation.model.service;
import static semi.common.JDBCtemplate.*;

import java.sql.Connection;
import java.util.ArrayList;


import semi.member.model.vo.Member;
import semi.mypage.editInformation.model.dao.InformationEditDao;
import semi.mypage.editInformation.model.vo.MemberInformation;
public class InformationEditService {
	

	public int updateMember(MemberInformation memberinformation, int userNo) {
        Connection conn = getConnection();
        
        int result = new InformationEditDao().updateMember(conn, memberinformation, userNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
	
	
	public int DeleteMember(int userNo) {
		Connection conn =getConnection();
		
		int result=new InformationEditDao().DeleteMember(conn, userNo);
			if(result > 0) {
		        commit(conn);
		    } else {
		        rollback(conn);
		    }
		        
		       close(conn);
		       return result;
	}
	
	public int checkNickname(String nickname) {
	    Connection conn = getConnection();
	    int result = new InformationEditDao().checkNickname(conn, nickname);
	    close(conn);
	    return result;
	}
	
	
}
