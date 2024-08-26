package db.com.semi.adminMember.model.vo;

import java.sql.Date;

public class AdReport {
	
	public AdReport() {}
	
		private int reportNo;
	 private String reprotContent;
	  private String reprotStatus;
		   private int review_no;
	   private int pNo;
	   private int pComNo;
	   private int oneNo;
   private int oComNo;
	   private int cNo;
	   private int userNo;
	   private String userName;
	   private Date createReport;
	   
	   
	public AdReport(int reportNo, String reprotContent, String reprotStatus, int review_no, int pNo, int pComNo,
			int oneNo, int oComNo, int cNo, int userNo, String userName, Date createReport) {
		super();
		this.reportNo = reportNo;
		this.reprotContent = reprotContent;
		this.reprotStatus = reprotStatus;
		this.review_no = review_no;
		this.pNo = pNo;
		this.pComNo = pComNo;
		this.oneNo = oneNo;
		this.oComNo = oComNo;
		this.cNo = cNo;
		this.userNo = userNo;
		this.userName = userName;
		this.createReport = createReport;
	}


	public int getReportNo() {
		return reportNo;
	}


	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}


	public String getReprotContent() {
		return reprotContent;
	}


	public void setReprotContent(String reprotContent) {
		this.reprotContent = reprotContent;
	}


	public String getReprotStatus() {
		return reprotStatus;
	}


	public void setReprotStatus(String reprotStatus) {
		this.reprotStatus = reprotStatus;
	}


	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}


	public int getpNo() {
		return pNo;
	}


	public void setpNo(int pNo) {
		this.pNo = pNo;
	}


	public int getpComNo() {
		return pComNo;
	}


	public void setpComNo(int pComNo) {
		this.pComNo = pComNo;
	}


	public int getOneNo() {
		return oneNo;
	}


	public void setOneNo(int oneNo) {
		this.oneNo = oneNo;
	}


	public int getoComNo() {
		return oComNo;
	}


	public void setoComNo(int oComNo) {
		this.oComNo = oComNo;
	}


	public int getcNo() {
		return cNo;
	}


	public void setcNo(int cNo) {
		this.cNo = cNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Date getCreateReport() {
		return createReport;
	}


	public void setCreateReport(Date createReport) {
		this.createReport = createReport;
	}


	@Override
	public String toString() {
		return "AdReport [reportNo=" + reportNo + ", reprotContent=" + reprotContent + ", reprotStatus=" + reprotStatus
				+ ", review_no=" + review_no + ", pNo=" + pNo + ", pComNo=" + pComNo + ", oneNo=" + oneNo + ", oComNo="
				+ oComNo + ", cNo=" + cNo + ", userNo=" + userNo + ", userName=" + userName + ", createReport="
				+ createReport + "]";
	}
	
	   
	   

}
