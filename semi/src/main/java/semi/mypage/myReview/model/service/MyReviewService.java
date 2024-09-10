package semi.mypage.myReview.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.PageInfo;
import semi.mypage.myReview.model.dao.MyReviewDao;
import semi.mypage.myReview.model.vo.Review;
import static semi.common.JDBCtemplate.*;

public class MyReviewService {

	//리뷰 개수(페이징용)
    public int selectListCount(int userNo) {
        Connection conn = getConnection();
        int listCount = new MyReviewDao().getListCount(conn, userNo);
        close(conn);
        return listCount;
    }
    
    // 리스트 가져오기
    public ArrayList<Review> selectList(PageInfo pi, int userNo) {
        Connection conn = getConnection();
        ArrayList<Review> list = new MyReviewDao().selectList(conn, pi, userNo, "date"); // 기본 정렬은 날짜 순
        close(conn);
        return list;
    }

    
    // 정렬됬을때 가져오는 리스트
    public ArrayList<Review> selectList(PageInfo pi, int userNo, String sort) {
        Connection conn = getConnection();
        ArrayList<Review> list = new MyReviewDao().selectList(conn, pi, userNo, sort);
        close(conn);
        return list;
    }
    
    
    //리뷰삭제
    public int deleteMyReview(int reviewNo) {
    	Connection conn = getConnection();
    	
    	int result = new MyReviewDao().deleteMyReview(conn, reviewNo);
    	
    	if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
    	
    	close(conn);
    	
    	return result;
    }
    
   
    
}