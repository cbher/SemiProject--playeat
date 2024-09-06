package db.com.semi.adOneDay.model.vo;

public class Attechment {
	public Attechment() {}
	
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private int aNo;
	private int refNo;
	public Attechment(int fileNo, String originName, String changeName, String filePath, int fileLevel, int aNo,
			int refNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.aNo = aNo;
		this.refNo = refNo;
	}


	public Attechment(int fileNo, String originName, String changeName, String filePath, int fileLevel, int aNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.aNo = aNo;
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
	public int getANo() {
		return aNo;
	}
	public void setAno(int aNo) {
		this.aNo = aNo;
	}


	public int getaNo() {
		return aNo;
	}


	public void setaNo(int aNo) {
		this.aNo = aNo;
	}


	public int getRefNo() {
		return refNo;
	}


	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}


	@Override
	public String toString() {
		return "Attechment [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", aNo=" + aNo + ", refNo=" + refNo + "]";
	}





	


}
