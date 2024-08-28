package semi.oneday.model.vo;

import java.sql.Date;

public class Comment {
	
	private int comNo;
	private String comContent;
	private int score;
	private Date CreateDate;
	private int userNo;
	private String status;
	private int oneNo;
	
	private String nickName;
	private String userName;
	
	public Comment() {}

	
	

	public Comment(int comNo, String comContent, int score, Date createDate, int userNo, String status, int oneNo,
			String nickName, String userName) {
		super();
		this.comNo = comNo;
		this.comContent = comContent;
		this.score = score;
		CreateDate = createDate;
		this.userNo = userNo;
		this.status = status;
		this.oneNo = oneNo;
		this.nickName = nickName;
		this.userName = userName;
	}

	


	public Comment(String comContent, int score, Date createDate, String userName, String nickName) {
		super();
		this.comContent = comContent;
		this.score = score;
		CreateDate = createDate;
		this.userName = userName;
		this.nickName = nickName;
	}




	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
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

	public int getOneNo() {
		return oneNo;
	}

	public void setOneNo(int oneNo) {
		this.oneNo = oneNo;
	}
	
	
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Comment [comNo=" + comNo + ", comContent=" + comContent + ", score=" + score + ", CreateDate="
				+ CreateDate + ", userNo=" + userNo + ", status=" + status + ", oneNo=" + oneNo + ", nickName="
				+ nickName + ", userName=" + userName + "]";
	}

	
	

}
