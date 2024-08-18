package com.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.mypage.model.dao.MypageDao;
import com.review.model.vo.Review;
import static com.common.JDBCtemplate.*;

public class MypageService {

	
	public Review selectList(int userNo) {
		Connection conn= getConnection();
		
		Review r = new MypageDao().selectList(conn, userNo);
		
		close(conn);
		
		return r;
		

		
	}
	
	
	
}
