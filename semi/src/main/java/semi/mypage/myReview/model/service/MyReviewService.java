package semi.mypage.myReview.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.mypage.myReview.model.dao.MyReviewDao;
import semi.mypage.myReview.model.vo.Review;
import static semi.common.JDBCtemplate.*;

public class MyReviewService {

	
	public ArrayList<Review> selectList(int userNo) {
		Connection conn= getConnection();
		
		ArrayList<Review> r = new MyReviewDao().selectList(conn, userNo);
		
		close(conn);
		
		return r;
		

		
	}
	
	
	
}
