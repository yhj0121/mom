package com.mom.momhome.teamjoin;

import com.mom.momhome.common.BaseDto;

public class TeamjoinDto extends BaseDto {
	private String teamjoin_key="";
	private String team_key="";
	private String user_key="";
	private String teamjoin_proc=""; //기본값-1, 가입 요청-2, 가입 수락-3, 가입 거절-4,탈퇴 요청-5, 탈퇴 수락-6, 퇴출-7
	private String user_name="";
	private String team_name="";
	private String user_position="";
	private String user_intro="";
	private String membership_role="";
	public String getMembership_role() {
		return membership_role;
	}
	public void setMembership_role(String membership_role) {
		this.membership_role = membership_role;
	}
	public String getUser_intro() {
		return user_intro;
	}
	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}
	public String getUser_position() {
		return user_position;
	}
	public void setUser_position(String user_position) {
		this.user_position = user_position;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getTeamjoin_key() {
		return teamjoin_key;
	}
	public void setTeamjoin_key(String teamjoin_key) {
		this.teamjoin_key = teamjoin_key;
	}
	public String getTeam_key() {
		return team_key;
	}
	public void setTeam_key(String team_key) {
		this.team_key = team_key;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getTeamjoin_proc() {
		return teamjoin_proc;
	}
	public void setTeamjoin_proc(String teamjoin_proc) {
		this.teamjoin_proc = teamjoin_proc;
	}
	@Override
	public String toString() {
		return "TeamjoinDto [teamjoin_key=" + teamjoin_key + ", team_key=" + team_key + ", user_key=" + user_key
				+ ", teamjoin_proc=" + teamjoin_proc + ", user_name=" + user_name + ", team_name=" + team_name
				+ ", user_position=" + user_position + ", user_intro=" + user_intro + ", membership_role="
				+ membership_role + "]";
	}
}
