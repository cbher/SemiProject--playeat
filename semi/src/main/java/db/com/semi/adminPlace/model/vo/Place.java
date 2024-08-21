package db.com.semi.adminPlace.model.vo;

public class Place {
	
	public void place() {}
	private int pNo;
	private String pTitle;
	private String address;
	private String pCall;
	private String pStatus;
	private int temCateNo;
	private int pScore;
	private int locationNo;
	private int pSelectNum;
	private int rcategoryNo;
	public Place(int pNo, String pTitle, String address, String pCall, String pStatus, int temCateNo, int pScore,
			int locationNo, int pSelectNum, int rcategoryNo) {
		super();
		this.pNo = pNo;
		this.pTitle = pTitle;
		this.address = address;
		this.pCall = pCall;
		this.pStatus = pStatus;
		this.temCateNo = temCateNo;
		this.pScore = pScore;
		this.locationNo = locationNo;
		this.pSelectNum = pSelectNum;
		this.rcategoryNo = rcategoryNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getpCall() {
		return pCall;
	}
	public void setpCall(String pCall) {
		this.pCall = pCall;
	}
	public String getpStatus() {
		return pStatus;
	}
	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}
	public int getTemCateNo() {
		return temCateNo;
	}
	public void setTemCateNo(int temCateNo) {
		this.temCateNo = temCateNo;
	}
	public int getpScore() {
		return pScore;
	}
	public void setpScore(int pScore) {
		this.pScore = pScore;
	}
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public int getpSelectNum() {
		return pSelectNum;
	}
	public void setpSelectNum(int pSelectNum) {
		this.pSelectNum = pSelectNum;
	}
	public int getRcategoryNo() {
		return rcategoryNo;
	}
	public void setRcategoryNo(int rcategoryNo) {
		this.rcategoryNo = rcategoryNo;
	}
	@Override
	public String toString() {
		return "Place [pNo=" + pNo + ", pTitle=" + pTitle + ", address=" + address + ", pCall=" + pCall + ", pStatus="
				+ pStatus + ", temCateNo=" + temCateNo + ", pScore=" + pScore + ", locationNo=" + locationNo
				+ ", pSelectNum=" + pSelectNum + ", rcategoryNo=" + rcategoryNo + "]";
	}
	
	
	

}
