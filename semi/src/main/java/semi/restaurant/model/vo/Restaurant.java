package semi.restaurant.model.vo;

public class Restaurant {
	private int placeNo;
	private String placeTitle;
	private String address;
	private String placeCall;
	private String status;
	private double placeScore;
	private int locationNo;
	private int placeSelectNo;
	private String businessTime;
	
	private String titleImg;
	public Restaurant() {}

	public Restaurant(int placeNo, String placeTitle, String address, String placeCall, String status,
			double placeScore, int locationNo, int placeSelectNo, String businessTime, String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.address = address;
		this.placeCall = placeCall;
		this.status = status;
		this.placeScore = placeScore;
		this.locationNo = locationNo;
		this.placeSelectNo = placeSelectNo;
		this.businessTime = businessTime;
		this.titleImg = titleImg;
	}
	
	public Restaurant(int placeNo, String placeTitle, String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.titleImg = titleImg;
	}

	public Restaurant(int placeNo, String placeTitle, String address, String placeCall, double placeScore,
			String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.address = address;
		this.placeCall = placeCall;
		this.placeScore = placeScore;
		this.titleImg = titleImg;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getPlaceTitle() {
		return placeTitle;
	}

	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPlaceCall() {
		return placeCall;
	}

	public void setPlaceCall(String placeCall) {
		this.placeCall = placeCall;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getPlaceScore() {
		return placeScore;
	}

	public void setPlaceScore(double placeScore) {
		this.placeScore = placeScore;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public int getPlaceSelectNo() {
		return placeSelectNo;
	}

	public void setPlaceSelectNo(int placeSelectNo) {
		this.placeSelectNo = placeSelectNo;
	}

	public String getBusinessTime() {
		return businessTime;
	}

	public void setBusinessTime(String businessTime) {
		this.businessTime = businessTime;
	}
	
	

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Restaurant [placeNo=" + placeNo + ", placeTitle=" + placeTitle + ", address=" + address + ", placeCall="
				+ placeCall + ", status=" + status + ", placeScore=" + placeScore + ", locationNo=" + locationNo
				+ ", placeSelectNo=" + placeSelectNo + ", businessTime=" + businessTime + "]";
	}
	
	
}
