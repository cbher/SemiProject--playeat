package semi.mypage.editInformation.model.vo;

public class MemberInformation {
	
	private int userNo;
	private String userName;
	private String userPwd;
	private String phone;
	private String email;
	private String introduce;
	
	
	public MemberInformation() {}

	public MemberInformation(int userNo, String userName, String userPwd, String phone, String email
			) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userPwd = userPwd;
		this.phone = phone;
		this.email = email;
		
	}
	
	
	public MemberInformation(String userName, String userPwd, String phone, String email) {
		super();
		this.userName = userName;
		this.userPwd = userPwd;
		this.phone = phone;
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "MemberInformation [userName=" + userName + ", userPwd=" + userPwd + ", phone=" + phone + ", email="
				+ email + ", introduce=" + introduce + ", userNo=" + userNo + "]";
	}
	
	
}
