package com.mom.momhome.gamejoin;

import com.mom.momhome.common.BaseDto;

public class GameJoinDto extends BaseDto {
	private String matchingjoin_key ="";
	private String team_key="";
	private String result_proc="1"; //수락은 1 거절은 2
	private String game_key="";
	private String matching_date=""; //matchingjoin 테이블 사용
	private String team_name="";
	private String user_key="";
	private String home_team_name="";
	private String game_fdate="";
	private String game_location="";
	
	public String getGame_location() {
		return game_location;
	}
	public void setGame_location(String game_location) {
		this.game_location = game_location;
	}
	public String getHome_team_name() {
		return home_team_name;
	}
	public void setHome_team_name(String home_team_name) {
		this.home_team_name = home_team_name;
	}
	public String getGame_fdate() {
		return game_fdate;
	}
	public void setGame_fdate(String game_fdate) {
		this.game_fdate = game_fdate;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getMatchingjoin_key() {
		return matchingjoin_key;
	}
	public void setMatchingjoin_key(String matchingjoin_key) {
		this.matchingjoin_key = matchingjoin_key;
	}
	public String getTeam_key() {
		return team_key;
	}
	public void setTeam_key(String team_key) {
		this.team_key = team_key;
	}
	public String getResult_proc() {
		return result_proc;
	}
	public void setResult_proc(String result_proc) {
		this.result_proc = result_proc;
	}
	public String getGame_key() {
		return game_key;
	}
	public void setGame_key(String game_key) {
		this.game_key = game_key;
	}
	public String getMatching_date() {
		return matching_date;
	}
	public void setMatching_date(String matching_date) {
		this.matching_date = matching_date;
	}

	@Override
	public String toString() {
		return "GameJoinDto [matchingjoin_key=" + matchingjoin_key + ", team_key=" + team_key + ", result_proc="
				+ result_proc + ", game_key=" + game_key + ", matching_date=" + matching_date + ", team_name="
				+ team_name + ", user_key=" + user_key + ", home_team_name=" + home_team_name + ", game_date="
				+ game_fdate + "]";
	}
}
