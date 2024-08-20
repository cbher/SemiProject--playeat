package com.mypage.myInquire.model.vo;

import java.sql.Date;

public class Inquire {

	private int inquireNo;
	private String inquireTitle;
	private String inqiureContent;
	private String writerName;
	private int inquireWriter;
	private Date createDate;
	private String status;
	private String answer;
	
	
	public Inquire() {}
	

	public Inquire(int inquireNo, String inquireTitle, String writerName, Date createDate, String status) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.writerName = writerName;
		this.createDate = createDate;
		this.status = status;
	}



	public Inquire(int inquireNo, String inquireTitle, String inqiureContent, String writerName, int inquireWriter,
			Date createDate, String status, String answer) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inqiureContent = inqiureContent;
		this.writerName = writerName;
		this.inquireWriter = inquireWriter;
		this.createDate = createDate;
		this.status = status;
		this.answer = answer;
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

	public String getInqiureContent() {
		return inqiureContent;
	}

	public void setInqiureContent(String inqiureContent) {
		this.inqiureContent = inqiureContent;
	}

	public int getInquireWriter() {
		return inquireWriter;
	}

	public void setInquireWriter(int inquireWriter) {
		this.inquireWriter = inquireWriter;
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

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	@Override
	public String toString() {
		return "inquire [inquireNo=" + inquireNo + ", inquireTitle=" + inquireTitle + ", inqiureContent="
				+ inqiureContent + ", inquireWriter=" + inquireWriter + ", createDate=" + createDate + ", status="
				+ status + ", answer=" + answer + ", writerName=" + writerName + "]";
	}
	
	
	
	
	
	
	
	
}
