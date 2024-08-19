package com.member.model.service;

import java.sql.Connection;

import com.member.model.dao.MemberDao;
import com.member.model.vo.Member;
import static com.common.JDBCtemplate.*;


public class MemberService {

    public Member loginMember(String userId, String userPwd) {
        Connection conn = getConnection();
        Member member = new MemberDao().loginMember(conn, userId, userPwd);
        
        close(conn);
        
        return member;
    }

    
    public Member selectMember(int userNo) {
        Connection conn = getConnection();
        Member member = new MemberDao().selectMember(conn, userNo);
        
        
        close(conn);
        
        return member;
    }
    
    
    
   
}