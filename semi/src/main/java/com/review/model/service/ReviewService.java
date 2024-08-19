package com.review.model.service;

import static com.common.JDBCtemplate.close;
import static com.common.JDBCtemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.member.model.dao.MemberDao;
import com.member.model.vo.Member;
import com.review.model.dao.ReviewDao;
import com.review.model.vo.Review;

public class ReviewService {
	
	
	 public ArrayList<Review> selectMember(int userNo) {
	        Connection conn = getConnection();
	        ArrayList<Review> review = new ReviewDao().selectMember(conn, userNo);
	        
	        
	        close(conn);
	        
	        return review;
	    }
	 
	 
	 
	 
	 
}
