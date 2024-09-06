package semi.play.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.cooking.model.vo.Attachment;
import semi.play.model.dao.PlayDao;
import semi.play.model.vo.Play;
import semi.play.model.vo.PlayReply;

public class PlayService {

	public ArrayList<Play> selectPlayList(){
		Connection conn = getConnection();
		ArrayList<Play> list = new PlayDao().selectPlayList(conn);
		close(conn);
		return list;
	}
	
	public Play selectDetailPlay(int placeNo) {
		Connection conn = getConnection();
		Play p = new PlayDao().selectDetailPlay(conn, placeNo);
		close(conn);
		return p;
	}
	
	public ArrayList<Attachment> selectAttachmentList(int placeNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new PlayDao().selectAttachmentList(conn, placeNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Play> selectPlaySimilarList(int categoryNo, int placeNo){
		Connection conn = getConnection();
		ArrayList<Play> list = new PlayDao().selectPlaySimilarList(conn, categoryNo, placeNo);
		close(conn);
		return list;
	}
	
	public ArrayList<PlayReply> selectPlayReply(int placeNo){
		Connection conn = getConnection();
		ArrayList<PlayReply> list = new PlayDao().selectPlayReply(conn, placeNo);
		close(conn);
		return list;
	}
	
	public int insertReply(PlayReply pr) {
		Connection conn = getConnection();
		int result = new PlayDao().insertReply(conn, pr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public double selectScore(int placeNo) {
		Connection conn = getConnection();
		double score = new PlayDao().selectScore(conn, placeNo);
		commit(conn);
		close(conn);
		return score;
	}
	
	public int selectLikeCount(int placeNo, int userNo) {
		Connection conn = getConnection();
		int likeCount = new PlayDao().selectLikeCount(conn, placeNo, userNo);
		close(conn);
		return likeCount;
	}
	
	public int insertLikeList(int placeNo, int userNo) {
		Connection conn = getConnection();
		int result = new PlayDao().insertLikeList(conn, placeNo, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int deleteLikeList(int placeNo, int userNo) {
		Connection conn = getConnection();
		int result = new PlayDao().deleteLikeList(conn, placeNo, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Play> mainPageSelectPlay(){
		Connection conn = getConnection();
		ArrayList<Play> plist = new PlayDao().mainPageSelectPlay(conn);
		
		close(conn);
		return plist;
		
	}

	public double scoreAvg(int placeNo) {
		Connection conn = getConnection();
		double score = new PlayDao().scoreAvg(conn, placeNo);
		commit(conn);
		close(conn);
		return score;
	}
	
	public int reportReply(int placeNo, int comNo, String userId) {
		Connection conn = getConnection();
		int result = new PlayDao().reportReply(conn, placeNo, comNo, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
}
