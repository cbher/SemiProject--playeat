package semi.mypage.myOneComment.model.vo;

import java.sql.Date;

public class OneComment {

	private int comNo;
	private String comContent;
	private int score;
	private Date createDate;
	private int userNo;
	private String status;
	private int oneNo;
	private String pTitle;
	
	public OneComment() {}

	public OneComment(int comNo, String comContent, int score, Date createDate, int userNo, String status, int oneNo,
			String pTitle) {
		super();
		this.comNo = comNo;
		this.comContent = comContent;
		this.score = score;
		this.createDate = createDate;
		this.userNo = userNo;
		this.status = status;
		this.oneNo = oneNo;
		this.pTitle = pTitle;
	}

	
	
	public OneComment(int comNo, String comContent, int score, Date createDate, String status,
			String pTitle) {
		super();
		this.comNo = comNo;
		this.comContent = comContent;
		this.score = score;
		this.createDate = createDate;
		this.status = status;
		this.pTitle = pTitle;
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
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	@Override
	public String toString() {
		return "OneComment [comNo=" + comNo + ", comContent=" + comContent + ", score=" + score + ", createDate="
				+ createDate + ", userNo=" + userNo + ", status=" + status + ", oneNo=" + oneNo + ", pTitle=" + pTitle
				+ "]";
	}
	
	
	
	
}
