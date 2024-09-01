package semi.oneday.model.vo;

import java.util.Date;

public class Oneday {
	
	private int oneNo;
	private String oneTitle;
	private String phone;
	private String address;
	private String status;
	private int locationNo;
	private int entPeople;
	private String temaCategory;
	private String onedayCategory;
	private double score;
	private int price;
	private Date startTime;
	private Date endTime;
	
	private String titleImg;
	
	public Oneday() {}

	public Oneday(int oneNo, String oneTitle, String phone, String address, String status, int locationNo,
			int entPeople, String temaCategory, String onedayCategory, double score, int price, Date startTime,
			Date endTime) {
		super();
		this.oneNo = oneNo;
		this.oneTitle = oneTitle;
		this.phone = phone;
		this.address = address;
		this.status = status;
		this.locationNo = locationNo;
		this.entPeople = entPeople;
		this.temaCategory = temaCategory;
		this.onedayCategory = onedayCategory;
		this.score = score;
		this.price = price;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	

	public Oneday(int oneNo, String oneTitle, String address, int entPeople, double score, int price, String titleImg) {
		super();
		this.oneNo = oneNo;
		this.oneTitle = oneTitle;
		this.address = address;
		this.entPeople = entPeople;
		this.score = score;
		this.price = price;
		this.titleImg = titleImg;
	}
	
	
	
	

	public Oneday(int oneNo, String oneTitle, String address, String phone, int entPeople, double score, int price,
			String titleImg) {
		super();
		this.oneNo = oneNo;
		this.oneTitle = oneTitle;
		this.phone = phone;
		this.address = address;
		this.entPeople = entPeople;
		this.score = score;
		this.price = price;
		this.titleImg = titleImg;
	}

	public Oneday(int oneNo, String oneTitle, double score, int price, String titleImg) {
		super();
		this.oneNo = oneNo;
		this.oneTitle = oneTitle;
		this.score = score;
		this.price = price;
		this.titleImg = titleImg;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public int getEntPeople() {
		return entPeople;
	}

	public void setEntPeople(int entPeople) {
		this.entPeople = entPeople;
	}

	public String getTemaCategory() {
		return temaCategory;
	}

	public void setTemaCategory(String temaCategory) {
		this.temaCategory = temaCategory;
	}

	public String getOnedayCategory() {
		return onedayCategory;
	}

	public void setOnedayCategory(String onedayCategory) {
		this.onedayCategory = onedayCategory;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Oneday [oneNo=" + oneNo + ", oneTitle=" + oneTitle + ", phone=" + phone + ", address=" + address
				+ ", status=" + status + ", locationNo=" + locationNo + ", entPeople=" + entPeople + ", temaCategory="
				+ temaCategory + ", onedayCategory=" + onedayCategory + ", score=" + score + ", price=" + price
				+ ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	
	
}
