package com.psvm.myPage.vo;

public class MyInfo {
	
	private String nickName;
	private int userLv;
	private String userId;
	private String userPwd;
	private String gender;
	private String phone;
	private String email;
	private String address;
	
	public MyInfo() {
		super();
	}

	public MyInfo(String nickName, int userLv, String userId, String userPwd, String gender, String phone, String email,
			String address) {
		super();
		this.nickName = nickName;
		this.userLv = userLv;
		this.userId = userId;
		this.userPwd = userPwd;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getUserLv() {
		return userLv;
	}

	public void setUserLv(int userLv) {
		this.userLv = userLv;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "MyInfo [nickName=" + nickName + ", userLv=" + userLv + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", address=" + address + "]";
	}
	
}
