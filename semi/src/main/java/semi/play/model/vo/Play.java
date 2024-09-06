package semi.play.model.vo;

public class Play {
	
	private int placeNo;
	private String placeTitle;
	private String address;
	private String placeCall;
	private String status;
	private int temaCategory;
	private double score;
	private int locationNo;
	private int placeSelectNo;
	private String businessTime;
	private String titleImg;
	
	public Play() {}

	public Play(int placeNo, String placeTitle, String address, String placeCall, String status, int temaCategory,
			double score, int locationNo, int placeSelectNo, String businessTime, String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.address = address;
		this.placeCall = placeCall;
		this.status = status;
		this.temaCategory = temaCategory;
		this.score = score;
		this.locationNo = locationNo;
		this.placeSelectNo = placeSelectNo;
		this.businessTime = businessTime;
		this.titleImg = titleImg;
	}
	
	

	public Play(int placeNo, String placeTitle, String address, String placeCall, double score, String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.address = address;
		this.placeCall = placeCall;
		this.score = score;
		this.titleImg = titleImg;
	}

	public Play(int placeNo, String placeTitle, int placeSelectNo, String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.placeSelectNo = placeSelectNo;
		this.titleImg = titleImg;
	}
	
	
	

	public Play(int placeNo, String placeTitle, String address, String placeCall, double score, String businessTime,
			String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.address = address;
		this.placeCall = placeCall;
		this.score = score;
		this.businessTime = businessTime;
		this.titleImg = titleImg;
	}

	public Play(int placeNo, String placeTitle, String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
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

	public int getTemaCategory() {
		return temaCategory;
	}

	public void setTemaCategory(int temaCategory) {
		this.temaCategory = temaCategory;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
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
		return "Play [placeNo=" + placeNo + ", placeTitle=" + placeTitle + ", address=" + address + ", placeCall="
				+ placeCall + ", status=" + status + ", temaCategory=" + temaCategory + ", score=" + score
				+ ", locationNo=" + locationNo + ", placeSelectNo=" + placeSelectNo + ", businessTime=" + businessTime
				+ ", titleImg=" + titleImg + "]";
	}
	
	
	
}
