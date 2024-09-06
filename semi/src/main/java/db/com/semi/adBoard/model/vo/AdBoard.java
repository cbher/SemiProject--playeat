package db.com.semi.adBoard.model.vo;

import java.sql.Date;

public class AdBoard {
	
	public void AdNotice() {}
	

	private int cNo;
	private String cTitle;
	private String cContents;
	private Date cDate;
	private String status;
	private int cStar;
	private int count;
	private int userNo;
	private int cCategory;
	private String userName;
	public AdBoard(int cNo, String cTitle, String cContents, Date cDate, String status, int cStar, int count,
			int userNo, int cCategory, String userName) {
		super();
		this.cNo = cNo;
		this.cTitle = cTitle;
		this.cContents = cContents;
		this.cDate = cDate;
		this.status = status;
		this.cStar = cStar;
		this.count = count;
		this.userNo = userNo;
		this.cCategory = cCategory;
		this.userName = userName;
	}
	public AdBoard(int cNo, String cTitle, String cContents, Date cDate, String status, int cStar, int count,
			String userName, int cCategory) {
		super();
		this.cNo = cNo;
		this.cTitle = cTitle;
		this.cContents = cContents;
		this.cDate = cDate;
		this.status = status;
		this.cStar = cStar;
		this.count = count;
		this.userName = userName;
		this.cCategory = cCategory;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getcTitle() {
		return cTitle;
	}
	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}
	public String getcContents() {
		return cContents;
	}
	public void setcContents(String cContents) {
		this.cContents = cContents;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getcStar() {
		return cStar;
	}
	public void setcStar(int cStar) {
		this.cStar = cStar;
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
	public int getcCategory() {
		return cCategory;
	}
	public void setcCategory(int cCategory) {
		this.cCategory = cCategory;
	}
	@Override
	public String toString() {
		return "AdBoard [cNo=" + cNo + ", cTitle=" + cTitle + ", cContents=" + cContents + ", cDate=" + cDate
				+ ", status=" + status + ", cStar=" + cStar + ", count=" + count + ", userNo=" + userNo + ", cCategory="
				+ cCategory + ", userName=" + userName + "]";
	}
	
	

}
