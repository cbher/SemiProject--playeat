package db.com.semi.Questions.model.vo;

public class Attatment {
	

	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int inquire_no;
	public Attatment(int fileNo, String originName, String changeName, String filePath, int inquire_no) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.inquire_no = inquire_no;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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
	public int getInquire_no() {
		return inquire_no;
	}
	public void setInquire_no(int inquire_no) {
		this.inquire_no = inquire_no;
	}
	@Override
	public String toString() {
		return "Attatment [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", inquire_no=" + inquire_no + "]";
	}
	
	

}
