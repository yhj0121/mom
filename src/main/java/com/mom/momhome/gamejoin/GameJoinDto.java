package com.mom.momhome.gamejoin;

public class GameJoinDto {
	private String matchingjoin_key ="";
	private String team_key="";
	private String result_proc="1"; //수락은 1 거절은 2
	private String game_key="";
	private String matching_date=""; //matchingjoin 테이블 사용
	private String team_name="";
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
	
	
	
	

}
