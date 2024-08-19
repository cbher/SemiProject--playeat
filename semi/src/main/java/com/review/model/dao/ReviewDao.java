package com.review.model.dao;

import static com.common.JDBCtemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.member.model.vo.Member;

public class ReviewDao {
	
	 public ArrayList<Member> selectMember(Connection conn, int userNo) {
	        Member member = null;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        String sql = "SELECT * FROM MEMBER WHERE USER_NO = ?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, userNo);

	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                member = new Member(rset.getInt("user_no"),
	                                   
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return member;
	    }
	 
}
