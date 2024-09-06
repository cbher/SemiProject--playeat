package db.com.semi.adOneDay.model.vo;

public class adOneDayClass {
	
	public adOneDayClass() {}


	private int oneNo;
	private String oneTitle;
	private String phone;
	private String onePlace;
	private String oneStatus;
	private int locationNo;
	private String oneAgree;
	private int entPeople;
	private String temCateName;
	private String onecategoryName;
	private int score;
	private int price;
	private String startTime;
	private String endTime;
	private int temCateNo;
    private int  onecategoryNo;
    private String locationName;
	
	public adOneDayClass(int oneNo, String oneTitle, String phone, String onePlace, String oneStatus, int locationNo,
			String oneAgree, int entPeople, String temCateName, String onecategoryName, int score, int price, String startTime,
			String endTime) {
		super();
		this.oneNo = oneNo;
		this.oneTitle = oneTitle;
		this.phone = phone;
		this.onePlace = onePlace;
		this.oneStatus = oneStatus;
		this.locationNo = locationNo;
		this.oneAgree = oneAgree;
		this.entPeople = entPeople;
		this.temCateName = temCateName;
		this.onecategoryName = onecategoryName;
		this.score = score;
		this.price = price;
		this.startTime = startTime;
		this.endTime = endTime;
		
	}


	public adOneDayClass(int oneNo, String oneTitle, String phone, String onePlace, String oneStatus, int locationNo,
			String oneAgree, int entPeople, String temCateName, String onecategoryName, int score, int price,
			String startTime, String endTime, int temCateNo, int onecategoryNo) {
		super();
		this.oneNo = oneNo;
		this.oneTitle = oneTitle;
		this.phone = phone;
		this.onePlace = onePlace;
		this.oneStatus = oneStatus;
		this.locationNo = locationNo;
		this.oneAgree = oneAgree;
		this.entPeople = entPeople;
		this.temCateName = temCateName;
		this.onecategoryName = onecategoryName;
		this.score = score;
		this.price = price;
		this.startTime = startTime;
		this.endTime = endTime;
		this.temCateNo = temCateNo;
		this.onecategoryNo = onecategoryNo;
	}


	public adOneDayClass(int oneNo, String oneTitle, String phone, String onePlace, String oneStatus, int locationNo,
			String oneAgree, int entPeople, String temCateName, String onecategoryName, int score, int price,
			String startTime, String endTime, int temCateNo, int onecategoryNo, String locationName) {
		super();
		this.oneNo = oneNo;
		this.oneTitle = oneTitle;
		this.phone = phone;
		this.onePlace = onePlace;
		this.oneStatus = oneStatus;
		this.locationNo = locationNo;
		this.oneAgree = oneAgree;
		this.entPeople = entPeople;
		this.temCateName = temCateName;
		this.onecategoryName = onecategoryName;
		this.score = score;
		this.price = price;
		this.startTime = startTime;
		this.endTime = endTime;
		this.temCateNo = temCateNo;
		this.onecategoryNo = onecategoryNo;
		this.locationName = locationName;
	}


	public String getLocationName() {
		return locationName;
	}


	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}


	public int getTemCateNo() {
		return temCateNo;
	}


	public void setTemCateNo(int temCateNo) {
		this.temCateNo = temCateNo;
	}


	public int getOnecategoryNo() {
		return onecategoryNo;
	}


	public void setOnecategoryNo(int onecategoryNo) {
		this.onecategoryNo = onecategoryNo;
	}


	public int getOneNo() {
		return oneNo;
	}


	public void setOneNo(int oneNo) {
		this.oneNo = oneNo;
	}


	public String getOneTitle() {
		return oneTitle;
	}


	public void setOneTitle(String oneTitle) {
		this.oneTitle = oneTitle;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getOnePlace() {
		return onePlace;
	}


	public void setOnePlace(String onePlace) {
		this.onePlace = onePlace;
	}


	public String getOneStatus() {
		return oneStatus;
	}


	public void setOneStatus(String oneStatus) {
		this.oneStatus = oneStatus;
	}


	public int getLocationNo() {
		return locationNo;
	}


	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}


	public String getOneAgree() {
		return oneAgree;
	}


	public void setOneAgree(String oneAgree) {
		this.oneAgree = oneAgree;
	}


	public int getEntPeople() {
		return entPeople;
	}


	public void setEntPeople(int entPeople) {
		this.entPeople = entPeople;
	}


	public String getTemCateName() {
		return temCateName;
	}


	public void setTemCateName(String temCateName) {
		this.temCateName = temCateName;
	}


	public String getOnecategoryName() {
		return onecategoryName;
	}


	public void setOnecategoryName(String onecategoryName) {
		this.onecategoryName = onecategoryName;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	@Override
	public String toString() {
		return "adOneDayClass [oneNo=" + oneNo + ", oneTitle=" + oneTitle + ", phone=" + phone + ", onePlace="
				+ onePlace + ", oneStatus=" + oneStatus + ", locationNo=" + locationNo + ", oneAgree=" + oneAgree
				+ ", entPeople=" + entPeople + ", temCateName=" + temCateName + ", onecategoryName=" + onecategoryName
				+ ", score=" + score + ", price=" + price + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", temCateNo=" + temCateNo + ", onecategoryNo=" + onecategoryNo + ", getTemCateNo()=" + getTemCateNo()
				+ ", getOnecategoryNo()=" + getOnecategoryNo() + ", getOneNo()=" + getOneNo() + ", getOneTitle()="
				+ getOneTitle() + ", getPhone()=" + getPhone() + ", getOnePlace()=" + getOnePlace()
				+ ", getOneStatus()=" + getOneStatus() + ", getLocationNo()=" + getLocationNo() + ", getOneAgree()="
				+ getOneAgree() + ", getEntPeople()=" + getEntPeople() + ", getTemCateName()=" + getTemCateName()
				+ ", getOnecategoryName()=" + getOnecategoryName() + ", getScore()=" + getScore() + ", getPrice()="
				+ getPrice() + ", getStartTime()=" + getStartTime() + ", getEndTime()=" + getEndTime() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}



	
	

}
