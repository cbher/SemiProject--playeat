package semi.inquire.model.vo;

import java.sql.Date;

public class Inquire {
	
//	INQUIRE_NO
//	INQUIRE_TITLE
//	INQUIRE_CONTENT
//	INQUIRE_WRITER
//	CREATE_DATE
//	STATUS
//	ANSWER
	
	private int inquireNo;
	private String inquireTitle;
	private String inquireContent;
	private String inquireWriter;
	private Date createDate;
	private String status;
	private String answer;
	
	
	public Inquire() {}


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


	public String getInquireWriter() {
		return inquireWriter;
	}


	public void setInquireWriter(String inquireWriter) {
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


	public Inquire(int inquireNo, String inquireTitle, String inquireContent, String inquireWriter, Date createDate,
			String status, String answer) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireWriter = inquireWriter;
		this.createDate = createDate;
		this.status = status;
		this.answer = answer;
	}
	
	
	public Inquire(int inquireNo, String inquireTitle, String inquireWriter, Date createDate) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireWriter = inquireWriter;
		this.createDate = createDate;
	}
	
	public Inquire(int inquireNo, String inquireTitle, String inquireContent, String inquireWriter, Date createDate) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireWriter = inquireWriter;
		this.createDate = createDate;
	}

	

	public Inquire(int inquireNo, String inquireTitle, String inquireWriter, Date createDate, String status) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireWriter = inquireWriter;
		this.createDate = createDate;
		this.status = status;
	}


	@Override
	public String toString() {
		return "Inquire [inquireNo=" + inquireNo + ", inquireTitle=" + inquireTitle + ", inquireContent="
				+ inquireContent + ", inquireWriter=" + inquireWriter + ", createDate=" + createDate + ", status="
				+ status + ", answer=" + answer + "]";
	}
	
	

}
