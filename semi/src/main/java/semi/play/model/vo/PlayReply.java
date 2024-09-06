package semi.play.model.vo;

import java.util.Date;

public class PlayReply {

	private int commentNo;
	private String comment;
	private int score;
	private Date createDate;
	private String userId;
	private String status;
	private int placeNo;
	
	public PlayReply() {}

	public PlayReply(int commentNo, String comment, int score, Date createDate, String userId, String status,
			int placeNo) {
		super();
		this.commentNo = commentNo;
		this.comment = comment;
		this.score = score;
		this.createDate = createDate;
		this.userId = userId;
		this.status = status;
		this.placeNo = placeNo;
	}
	
	

	public PlayReply(int commentNo, String comment, int score, Date createDate, String userId) {
		super();
		this.commentNo = commentNo;
		this.comment = comment;
		this.score = score;
		this.createDate = createDate;
		this.userId = userId;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	@Override
	public String toString() {
		return "PlayReply [commentNo=" + commentNo + ", comment=" + comment + ", score=" + score + ", createDate="
				+ createDate + ", userId=" + userId + ", status=" + status + ", placeNo=" + placeNo + "]";
	}
	
	
}
