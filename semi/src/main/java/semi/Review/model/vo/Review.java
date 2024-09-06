package semi.Review.model.vo;

import java.sql.Date;

public class Review {
	
	private String rNo;
	private String rTitle;
	private String rContent;
	private Date rDate;
	private String score;
	private String userNo;
	private String status;
	private String pNo;
	private String titleImg;
	private String userName;
	private String nickName;
	
	public Review() {}

	public Review(String rNo, String rTitle, String rContent, Date rDate, String score, String userNo, String status,
			String pNo, String titleImg, String userName, String nickName) {
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
		this.userName = userName;
		this.nickName = nickName;
	}
	
	

	public Review(String rTitle, String rContent, String score, String userNo, String pNo) {
		super();
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.score = score;
		this.userNo = userNo;
		this.pNo = pNo;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
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

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Review [rNo=" + rNo + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rDate=" + rDate + ", score="
				+ score + ", userNo=" + userNo + ", status=" + status + ", pNo=" + pNo + ", titleImg=" + titleImg
				+ ", userName=" + userName + ", nickName=" + nickName + "]";
	}

	
	

}
