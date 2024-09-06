package semi.Review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.Review.model.dao.ReviewDao;
import semi.Review.model.vo.Attachment2;
import semi.Review.model.vo.Review;
import semi.play.model.dao.PlayDao;
import semi.play.model.vo.Play;

public class ReviewService {

	public int insertReview(Review review, semi.cooking.model.vo.Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertReview(conn, review);
		int result2 = 0;
		
		
			result2 = new ReviewDao().insertAttachment(conn, at);
		
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public ArrayList<Review> ReviewList(int placeNo) {
			Connection conn = getConnection();
		    ArrayList<Review> ReviewList = new ReviewDao().ReviewList(conn, placeNo);
		    close(conn);
		    return ReviewList;
	}

	public ArrayList<Play> recentRestaurant(int placeNo) {
		Connection conn = getConnection();
	    ArrayList<Play> ReviewList = new PlayDao().recentRestaurant(conn, placeNo);
	    close(conn);
	    return ReviewList;
	}

	public Review selectReview(int rNo) {
		Connection conn = getConnection();
		Review r = new ReviewDao().selectReview(conn, rNo);
		close(conn);
		return r;
	}

	public Attachment2 selectAttachment(int rNo) {
		Connection conn = getConnection();
		Attachment2 at = new ReviewDao().selectAttachment(conn, rNo);
		close(conn);
		return at;
		
	}

	public int reviewUpdate(Review review, semi.cooking.model.vo.Attachment at) {
Connection conn = getConnection();
		
		int result1 = new ReviewDao().reviewUpdate(conn, review);
		int result2 = 0;
		
		
			result2 = new ReviewDao().AttachmentUpdate(conn, at);
		
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public int deleteReview(int rNo) {
		Connection conn = getConnection();
		int result = 0;
		
		result = new ReviewDao().deleteReview(conn, rNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	

}
