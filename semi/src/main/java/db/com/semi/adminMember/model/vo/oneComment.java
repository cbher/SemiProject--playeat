package db.com.semi.adminMember.model.vo;

import java.sql.Date;

public class oneComment {
	public oneComment() {}
	private int comNo;
	private String comContent;
	private Date createDate;
	public oneComment(int comNo, String comContent, Date createDate) {
		super();
		this.comNo = comNo;
		this.comContent = comContent;
		this.createDate = createDate;
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "oneComment [comNo=" + comNo + ", comContent=" + comContent + ", createDate=" + createDate + "]";
	}
	
}
