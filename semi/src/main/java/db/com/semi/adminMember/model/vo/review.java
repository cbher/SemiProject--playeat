package db.com.semi.adminMember.model.vo;

import java.sql.Date;

public class review {
	public review() {}
	
	private int reveiwNo;
	private String rTitle;
	private String rContent;
	private Date rDate;
	private int playNo;
	public review(int reveiwNo, String rTitle, String rContent, Date rDate, int playNo) {
		super();
		this.reveiwNo = reveiwNo;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rDate = rDate;
		this.playNo = playNo;
	}
	public int getReveiwNo() {
		return reveiwNo;
	}
	public void setReveiwNo(int reveiwNo) {
		this.reveiwNo = reveiwNo;
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
	public int getPlayNo() {
		return playNo;
	}
	public void setPlayNo(int playNo) {
		this.playNo = playNo;
	}
	@Override
	public String toString() {
		return "review [reveiwNo=" + reveiwNo + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rDate=" + rDate
				+ ", playNo=" + playNo + "]";
	}
	

}
