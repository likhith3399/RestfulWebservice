package com.common.controller;

public class UserInfo {

	private String userId;
	private String emailId;
	private String day;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public UserInfo() {
		super();
	}
	public UserInfo(String emailId) {
		super();
		this.emailId = emailId;
	}
	public UserInfo(String userId,String emailId, String day) {
		super();
		this.userId = userId;
		this.emailId = emailId;
		this.day=day;
	}
	
}
