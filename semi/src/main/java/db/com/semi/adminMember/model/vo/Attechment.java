package db.com.semi.adminMember.model.vo;

public class Attechment {
	public Attechment() {}
	
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private int cNo;
	public Attechment(int fileNo, String originName, String changeName, String filePath, int fileLevel, int cNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.cNo = cNo;
	}
	

	public Attechment(int fileNo,String originName, String changeName, String filePath, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
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
	public int getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	public int getCNo() {
		return cNo;
	}
	public void setCno(int cNo) {
		this.cNo = cNo;
	}
	@Override
	public String toString() {
		return "Attechment [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", cNo=" + cNo + "]";
	}
	
	
	


}
