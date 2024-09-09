package semi.mypage.mylist.model.vo;

public class MyList {
	
	private int listNo;
	private String listTitle;
	private String phone;
	private String status;
	private String category;
	private String address;
	private double score;
	

	public MyList() {}
	
	public MyList(int listNo, String listTitle, String phone, String status, String category, String address,
			double score) {
		super();
		this.listNo = listNo;
		this.listTitle = listTitle;
		this.phone = phone;
		this.status = status;
		this.category = category;
		this.address = address;
		this.score = score;
	}
	
	public int getListNo() {
		return listNo;
	}
	public void setListNo(int listNo) {
		this.listNo = listNo;
	}
	public String getListTitle() {
		return listTitle;
	}
	public void setListTitle(String listTitle) {
		this.listTitle = listTitle;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "mylist [listNo=" + listNo + ", listTitle=" + listTitle + ", phone=" + phone + ", status=" + status
				+ ", category=" + category + ", address=" + address + ", score=" + score + "]";
	}
	
	
	
}
