package com.mom.momhome.team;

import com.mom.momhome.common.BaseDto;

public class TeamDto extends BaseDto{

	private String team_key = "";
	private String team_name = ""; 
	private String team_fdate = ""; 
	private String team_fee = "";  
	private String team_city = "";
	private String team_intro = ""; 
	private String team_emblem = ""; 
	private String team_notice = ""; 
	private String team_num = ""; 
	private String team_recruit_yn = "1"; //모집여부 상태 표시 , 1 yes, 2 no
	

	
	public String getTeam_key() {
		return team_key;
	}
	public void setTeam_key(String team_key) {
		this.team_key = team_key;
	}
	public String getTeam_city() {
		return team_city;
	}
	public void setTeam_city(String team_city) {
		this.team_city = team_city;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getTeam_fdate() {
		return team_fdate;
	}
	public void setTeam_fdate(String team_fdate) {
		this.team_fdate = team_fdate;
	}
	public String getTeam_fee() {
		return team_fee;
	}
	public void setTeam_fee(String team_fee) {
		this.team_fee = team_fee;
	}
	
	public String getTeam_intro() {
		return team_intro;
	}
	public void setTeam_intro(String team_intro) {
		this.team_intro = team_intro;
	}
	public String getTeam_emblem() {
		return team_emblem;
	}
	public void setTeam_emblem(String team_emblem) {
		this.team_emblem = team_emblem;
	}
	public String getTeam_notice() {
		return team_notice;
	}
	public void setTeam_notice(String team_notice) {
		this.team_notice = team_notice;
	}
	public String getTeam_num() {
		return team_num;
	}
	public void setTeam_num(String team_num) {
		this.team_num = team_num;
	}
	public String getTeam_recruit_yn() {
		return team_recruit_yn;
	}
	public void setTeam_recruit_yn(String team_recruit_yn) {
		this.team_recruit_yn = team_recruit_yn;
	}
	@Override
	public String toString() {
		return "TeamDto [team_key=" + team_key + ", team_name=" + team_name + ", team_fdate=" + team_fdate
				+ ", team_fee=" + team_fee + ", team_city=" + team_city + ", team_intro=" + team_intro
				+ ", team_emblem=" + team_emblem + ", team_notice=" + team_notice + ", team_num=" + team_num
				+ ", team_recruit_yn=" + team_recruit_yn + "]";
	} 
	
	
	
}

