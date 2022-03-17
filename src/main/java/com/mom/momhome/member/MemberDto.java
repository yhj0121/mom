package com.mom.momhome.member;

public class MemberDto {
	String user_key="";
	String user_id="";
	String user_password="";
	String user_name="";
	String user_mail="";
	String user_phone="";
	String user_address1="";
	String user_address2="";
	String user_position="";
	String user_intro="";
	int user_delete=1;
	int isManager=0;
	
	public int getIsManager() {
		return isManager;
	}
	public void setIsManager(int isManager) {
		this.isManager = isManager;
	}
	public int getUser_delete() {
		return user_delete;
	}
	public void setUser_delete(int user_delete) {
		this.user_delete = user_delete;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getUser_position() {
		return user_position;
	}
	public void setUser_position(String user_position) {
		this.user_position = user_position;
	}
	public String getUser_intro() {
		return user_intro;
	}
	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}
	@Override
	public String toString() {
		return "MemberDto [user_key=" + user_key + ", user_id=" + user_id + ", user_password=" + user_password
				+ ", user_name=" + user_name + ", user_mail=" + user_mail + ", user_phone=" + user_phone
				+ ", user_address1=" + user_address1 + ", user_address2=" + user_address2 + ", user_position="
				+ user_position + ", user_intro=" + user_intro + "]";
	}
}
