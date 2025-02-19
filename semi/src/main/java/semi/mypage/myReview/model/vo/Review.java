package semi.mypage.myReview.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String rTitle;
	private String rContent;
	private Date rDate;
	private int score;
	private int userNo;
	private String status;
	private int playNo;
	private String title;
	private String titleimg;
	private String changeName;
	
	public Review() {}

	public Review(int reviewNo, String rTitle, String rContent, Date rDate, String title, int score, String titleimg, String changeName) {
		super();
		this.reviewNo = reviewNo;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rDate = rDate;
		this.title = title;
		this.score = score;
		this.titleimg=titleimg;
		this.changeName=changeName;
	}

	public Review(int reviewNo, String rTitle, String rContent, Date rDate, int score, int userNo, String status,
			int playNo, String title, String titleimg, String changeName) {
		super();
		this.reviewNo = reviewNo;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rDate = rDate;
		this.score = score;
		this.userNo = userNo;
		this.status = status;
		this.playNo = playNo;
		this.title = title;
		this.titleimg = titleimg;
		this.changeName = changeName;
	}
	
	
	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPlayNo() {
		return playNo;
	}

	public void setPlayNo(int playNo) {
		this.playNo = playNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleimg() {
		return titleimg;
	}

	public void setTitleimg(String titleimg) {
		this.titleimg = titleimg;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rDate=" + rDate
				+ ", score=" + score + ", userNo=" + userNo + ", status=" + status + ", playNo=" + playNo + ", title="
				+ title + ", titleimg=" + titleimg + ", changeName=" + changeName + "]";
	}
	
	
	
	
	
}

	
	