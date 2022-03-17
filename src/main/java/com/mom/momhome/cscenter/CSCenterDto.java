package com.mom.momhome.cscenter;

import com.mom.momhome.common.BaseDto;

public class CSCenterDto extends BaseDto  {
	String cscenter_key="";
	String user_key="";
	String cscenter_title="";
	String cscenter_contents="";
	String user_name="";
	String cscenter_date="";
	int answered=0;

	public int getAnswered() {
		return answered;
	}
	public void setAnswered(int answered) {
		this.answered = answered;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCscenter_key() {
		return cscenter_key;
	}
	public void setCscenter_key(String cscenter_key) {
		this.cscenter_key = cscenter_key;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getCscenter_title() {
		return cscenter_title;
	}
	public void setCscenter_title(String cscenter_title) {
		this.cscenter_title = cscenter_title;
	}
	public String getCscenter_contents() {
		return cscenter_contents;
	}
	public void setCscenter_contents(String cscenter_contents) {
		this.cscenter_contents = cscenter_contents;
	}
	public String getCscenter_date() {
		return cscenter_date;
	}
	public void setCscenter_date(String cscenter_date) {
		this.cscenter_date = cscenter_date;
	}
}
