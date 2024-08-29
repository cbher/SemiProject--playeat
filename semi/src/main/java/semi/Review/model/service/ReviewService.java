package semi.Review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.Review.model.dao.ReviewDao;
import semi.Review.model.vo.Review;
import semi.cooking.model.vo.Attachment;
import semi.oneday.model.dao.OnedayDao;
import semi.oneday.model.vo.Comment;
import semi.play.model.dao.PlayDao;
import semi.play.model.vo.Play;

public class ReviewService {

	public int insertReview(Review r, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertReview(conn, r);
		int result2 = 1;
		
		if(at != null) {
			result2 = new ReviewDao().insertAttachment(conn, at);
		}
		
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

}
