package db.com.semi.Questions.model.vo;

import java.sql.Date;

public class Questions {
	public Questions() {}
	
	private int inquireNo;
	private String inquireTitle;
	private String inquireContent;
	private String inquireWirther;		
    private Date createDate;
	private String status;
	private String answer;
	
	
	
	public Questions(int inquireNo, String inquireTitle, String inquireContent, String inquireWirther, Date createDate,
			String status, String answer) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireWirther = inquireWirther;
		this.createDate = createDate;
		this.status = status;
		this.answer = answer;
	}





	public Questions(int inquireNo, String inquireTitle, String inquireContent, String inquireWirther, Date createDate,
			String status) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireWirther = inquireWirther;
		this.createDate = createDate;
		this.status = status;
	}





	public int getInquireNo() {
		return inquireNo;
	}



	public void setInquireNo(int inquireNo) {
		this.inquireNo = inquireNo;
	}



	public String getInquireTitle() {
		return inquireTitle;
	}



	public void setInquireTitle(String inquireTitle) {
		this.inquireTitle = inquireTitle;
	}



	public String getInquireContent() {
		return inquireContent;
	}



	public void setInquireContent(String inquireContent) {
		this.inquireContent = inquireContent;
	}



	public String getInquireWirther() {
		return inquireWirther;
	}



	public void setInquireWirther(String inquireWirther) {
		this.inquireWirther = inquireWirther;
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



	public String getAnswer() {
		return answer;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}



	@Override
	public String toString() {
		return "Questions [inquireNo=" + inquireNo + ", inquireTitle=" + inquireTitle + ", inquireContent="
				+ inquireContent + ", inquireWirther=" + inquireWirther + ", createDate=" + createDate + ", status="
				+ status + ", answer=" + answer + "]";
	}
	

}
