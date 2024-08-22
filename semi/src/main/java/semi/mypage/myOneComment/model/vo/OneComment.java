package semi.mypage.myOneComment.model.vo;

import java.sql.Date;

public class OneComment {

	private int comNo;
	private String comContext;
	private int score;
	private Date createDate;
	private int userNo;
	private String status;
	private int oneNo;
	
	public OneComment() {}
	
	
	public OneComment(int comNo, String comContext, int score, Date createDate, int userNo, String status, int oneNo) {
		super();
		this.comNo = comNo;
		this.comContext = comContext;
		this.score = score;
		this.createDate = createDate;
		this.userNo = userNo;
		this.status = status;
		this.oneNo = oneNo;
	}


	public int getComNo() {
		return comNo;
	}


	public void setComNo(int comNo) {
		this.comNo = comNo;
	}


	public String getComContext() {
		return comContext;
	}


	public void setComContext(String comContext) {
		this.comContext = comContext;
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


	@Override
	public String toString() {
		return "OneComment [comNo=" + comNo + ", comContext=" + comContext + ", score=" + score + ", createDate="
				+ createDate + ", userNo=" + userNo + ", status=" + status + ", oneNo=" + oneNo + "]";
	}
	
	
	
	
	
	
}
