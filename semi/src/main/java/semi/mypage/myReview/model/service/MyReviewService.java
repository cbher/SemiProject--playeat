package semi.mypage.myReview.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.PageInfo;
import semi.mypage.myReview.model.dao.MyReviewDao;
import semi.mypage.myReview.model.vo.Review;
import static semi.common.JDBCtemplate.*;

public class MyReviewService {

    public int selectListCount(int userNo) {
        Connection conn = getConnection();
        int listCount = new MyReviewDao().getListCount(conn, userNo);
        close(conn);
        return listCount;
    }

    public ArrayList<Review> selectList(PageInfo pi, int userNo) {
        Connection conn = getConnection();
        ArrayList<Review> list = new MyReviewDao().selectList(conn,pi, userNo);
        close(conn);
        return list;
    }
    
    public int deleteMyReview(int reviewNo) {
    	Connection conn = getConnection();
    	
    	int result = new MyReviewDao().deleteMyReview(conn, reviewNo);
    	close(conn);
    	
    	return result;
    }
}