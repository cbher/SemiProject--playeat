package com.mypage.myReview.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.mypage.myReview.model.dao.MyReviewDao;
import com.mypage.myReview.model.vo.Review;
import static com.common.JDBCtemplate.*;

public class MyReviewService {

	
	public ArrayList<Review> selectList(int userNo) {
		Connection conn= getConnection();
		
		ArrayList<Review> r = new MyReviewDao().selectList(conn, userNo);
		
		close(conn);
		
		return r;
		

		
	}
	
	
	
}
