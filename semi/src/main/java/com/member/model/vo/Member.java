package com.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private String phone;
	private String email;
	private Date enrollDate;
	private String status;
	private String introduce;
	private int reportCount;
	
	
	public Member(int userNo, String userId, String userPwd) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
	}

	
	public Member(int userNo, String userId, String userPwd, String userName, String nickName, String phone,
			String email, Date enrollDate, String status, String introduce, int reportCount) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.status = status;
		this.introduce = introduce;
		this.reportCount = reportCount;
	}

	public Member(){}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	
	
	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", nickName=" + nickName + ", phone=" + phone + ", email=" + email + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", introduce=" + introduce + ", reportCount=" + reportCount + "]";
	}
	
	
	
	
	
}
