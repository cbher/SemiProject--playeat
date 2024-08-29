package semi.Review.model.vo;

import java.sql.Date;

public class Review {
	
	private int rNo;
	private String rTitle;
	private String rContent;
	private Date rDate;
	private int score;
	private int userNo;
	private String status;
	private int pNo;
	private String titleImg;
	
	public Review() {}

	public Review(int rNo, String rTitle, String rContent, Date rDate, int score, int userNo, String status, int pNo,
			String titleImg) {
		super();
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rDate = rDate;
		this.score = score;
		this.userNo = userNo;
		this.status = status;
		this.pNo = pNo;
		this.titleImg = titleImg;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
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

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Review [rNo=" + rNo + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rDate=" + rDate + ", score="
				+ score + ", userNo=" + userNo + ", status=" + status + ", pNo=" + pNo + ", titleImg=" + titleImg + "]";
	};
	
	

}
