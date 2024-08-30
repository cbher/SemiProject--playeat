package semi.notice.model.vo;

import java.sql.Date;

public class Attechment {
	
	private int fileNo;
	private int refNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private int fileLevel;
	private String boardCategory;
	private int oneNo;
	private int cNo;
	private int placeNo;
	private int reviewNo;
	private int noticeNo;
	private int inquireNo;
	
	



	public Attechment() {}

	
	
	public Attechment(int fileNo, int refNo, String originName, String changeName, String filePath, Date uploadDate,
			String status, int fileLevel, String boardCategory, int oneNo, int cNo, int placeNo, int reviewNo,
			int noticeNo) {
		super();
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.fileLevel = fileLevel;
		this.boardCategory = boardCategory;
		this.oneNo = oneNo;
		this.cNo = cNo;
		this.placeNo = placeNo;
		this.reviewNo = reviewNo;
		this.noticeNo = noticeNo;
	}
	
	
	
	
	
	
	
	
	public Attechment(int fileNo, String originName, String changeName, String filePath, int fileLevel, int inquireNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.inquireNo = inquireNo;
	}
	
	
	public Attechment(int fileNo, String originName, String changeName, String filePath, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}



	public int getInquireNo() {
		return inquireNo;
	}



	public void setInquireNo(int inquireNo) {
		this.inquireNo = inquireNo;
	}



	public int getFileNo() {
		return fileNo;
	}



	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}



	public int getRefNo() {
		return refNo;
	}



	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}



	public String getOriginName() {
		return originName;
	}



	public void setOriginName(String originName) {
		this.originName = originName;
	}



	public String getChangeName() {
		return changeName;
	}



	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	public Date getUploadDate() {
		return uploadDate;
	}



	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getFileLevel() {
		return fileLevel;
	}



	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}



	public String getBoardCategory() {
		return boardCategory;
	}



	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}



	public int getOneNo() {
		return oneNo;
	}



	public void setOneNo(int oneNo) {
		this.oneNo = oneNo;
	}



	public int getcNo() {
		return cNo;
	}



	public void setcNo(int cNo) {
		this.cNo = cNo;
	}



	public int getPlaceNo() {
		return placeNo;
	}



	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}



	public int getReviewNo() {
		return reviewNo;
	}



	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}



	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	@Override
	public String toString() {
		return "Attechment [fileNo=" + fileNo + ", refNo=" + refNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status
				+ ", fileLevel=" + fileLevel + ", boardCategory=" + boardCategory + ", oneNo=" + oneNo + ", cNo=" + cNo
				+ ", placeNo=" + placeNo + ", reviewNo=" + reviewNo + ", noticeNo=" + noticeNo + "]";
	}
	
	

}
