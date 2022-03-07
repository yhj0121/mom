package com.mom.momhome.membership;

public class MembershipDto {
	String membership_key ="";
	String user_key ="";
	String team_key ="";
	String membership_role ="";
	String team_joindate ="";
	public String getMembership_key() {
		return membership_key;
	}
	public void setMembership_key(String membership_key) {
		this.membership_key = membership_key;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getTeam_key() {
		return team_key;
	}
	public void setTeam_key(String team_key) {
		this.team_key = team_key;
	}
	public String getMembership_role() {
		return membership_role;
	}
	public void setMembership_role(String membership_role) {
		this.membership_role = membership_role;
	}
	public String getTeam_joindate() {
		return team_joindate;
	}
	public void setTeam_joindate(String team_joindate) {
		this.team_joindate = team_joindate;
	}
}
