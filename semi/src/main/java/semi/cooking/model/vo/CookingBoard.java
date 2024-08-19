package semi.cooking.model.vo;

import java.util.Date;

public class CookingBoard {
	private int cBoardNo; // 요리게시판 글번호
	private String cBoardTitle; // 요리게시판 글 제목
	private String cBoardContent; 
	private Date createDate;
	private String status;
	private int score;
	private int count;
	private int userNo;
	private int cookCategory;
	
	public CookingBoard() {}

	public CookingBoard(int cBoardNo, String cBoardTitle, String cBoardContent, Date createDate, String status,
			int score, int count, int userNo, int cookCategory) {
		super();
		this.cBoardNo = cBoardNo;
		this.cBoardTitle = cBoardTitle;
		this.cBoardContent = cBoardContent;
		this.createDate = createDate;
		this.status = status;
		this.score = score;
		this.count = count;
		this.userNo = userNo;
		this.cookCategory = cookCategory;
	}

	public int getcBoardNo() {
		return cBoardNo;
	}

	public void setcBoardNo(int cBoardNo) {
		this.cBoardNo = cBoardNo;
	}

	public String getcBoardTitle() {
		return cBoardTitle;
	}

	public void setcBoardTitle(String cBoardTitle) {
		this.cBoardTitle = cBoardTitle;
	}

	public String getcBoardContent() {
		return cBoardContent;
	}

	public void setcBoardContent(String cBoardContent) {
		this.cBoardContent = cBoardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCookCategory() {
		return cookCategory;
	}

	public void setCookCategory(int cookCategory) {
		this.cookCategory = cookCategory;
	}

	@Override
	public String toString() {
		return "CookingBoard [cBoardNo=" + cBoardNo + ", cBoardTitle=" + cBoardTitle + ", cBoardContent="
				+ cBoardContent + ", createDate=" + createDate + ", status=" + status + ", score=" + score + ", count="
				+ count + ", userNo=" + userNo + ", cookCategory=" + cookCategory + "]";
	}
	
	
}
