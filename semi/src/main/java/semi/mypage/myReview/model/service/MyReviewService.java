package semi.mypage.myReview.model.service;

import java.io.Console;
import java.sql.Connection;
import java.util.ArrayList;

import semi.mypage.myReview.model.dao.MyReviewDao;
import semi.mypage.myReview.model.vo.Review;
import static semi.common.JDBCtemplate.*;

public class MyReviewService {

	
	public ArrayList<Review> selectList(int userNo) {
		Connection conn= getConnection();
		
		ArrayList<Review> list = new MyReviewDao().selectList(conn, userNo);
		
		
		close(conn);
		
		return list;
		

		
	}
	
	
	
}
