package com.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.member.model.vo.Member;
import static com.common.JDBCtemplate.*;

public class MemberDao {

    public Member loginMember(Connection conn, String userId, String userPwd) {
        Member member = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = "SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_PWD = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPwd);

            rset = pstmt.executeQuery();

            if (rset.next()) {
                member = new Member(rset.getInt("user_no"),
                                    rset.getString("user_id"),
                                    rset.getString("user_pwd"),
                                    rset.getString("user_name"),
                                    rset.getString("nickname"),
                                    rset.getString("phone"),
                                    rset.getString("email"),
                                    rset.getDate("enrolle_date"),
                                    rset.getString("status"),
                                    rset.getString("introduce"),
                                    rset.getInt("report_count"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return member;
    }

    public Member selectMember(Connection conn, int userNo) {
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
                                    rset.getString("user_id"),
                                    rset.getString("user_pwd"),
                                    rset.getString("user_name"),
                                    rset.getString("nickname"),
                                    rset.getString("phone"),
                                    rset.getString("email"),
                                    rset.getDate("enrolle_date"),
                                    rset.getString("status"),
                                    rset.getString("introduce"),
                                    rset.getInt("report_count"));
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