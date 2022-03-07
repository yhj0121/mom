package com.mom.momhome.mercenaryjoin;

public class MercenaryjoinDto {
	private String mercenaryjoin_key = "";
	private String mercenary_key = "";
	private String user_key = "";
	private String mercenary_proc = "1"; //1이면 신청 후 승인대기중. 2이면 승인. 3이면 거절.
	private String app_date = "";
	public String user_name = "";
	private String user_position = "";
	
	
	public String getMercenaryjoin_key() {
		return mercenaryjoin_key;
	}
	public void setMercenaryjoin_key(String mercenaryjoin_key) {
		this.mercenaryjoin_key = mercenaryjoin_key;
	}
	public String getMercenary_key() {
		return mercenary_key;
	}
	public void setMercenary_key(String mercenary_key) {
		this.mercenary_key = mercenary_key;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getMercenary_proc() {
		return mercenary_proc;
	}
	public void setMercenary_proc(String mercenary_proc) {
		this.mercenary_proc = mercenary_proc;
	}
	public String getApp_date() {
		return app_date;
	}
	public void setApp_date(String app_date) {
		this.app_date = app_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_position() {
		return user_position;
	}
	public void setUser_position(String user_position) {
		this.user_position = user_position;
	}
	
}
