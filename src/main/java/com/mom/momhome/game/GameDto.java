package com.mom.momhome.game;

import com.mom.momhome.common.BaseDto;

public class GameDto extends BaseDto {
	private String game_key="";
	private String team_key="";
	private String game_date="";
	private String game_location="";
	private String game_title="";
	private String game_contents="";
	private String game_fdate="";
	private String team_name="";
	public String user_name="";
	public String user_key="";
	public String team_city = "";
	public String game_complete ="0";  //게임 모집중 or 완료 
	
	

	
	public String getGame_complete() {
		return game_complete;
	}
	public void setGame_complete(String game_complete) {
		this.game_complete = game_complete;
	}
	public String getTeam_city() {
		return team_city;
	}
	public void setTeam_city(String team_city) {
		this.team_city = team_city;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getGame_key() {
		return game_key;
	}
	public void setGame_key(String game_key) {
		this.game_key = game_key;
	}
	public String getTeam_key() {
		return team_key;
	}
	public void setTeam_key(String team_key) {
		this.team_key = team_key;
	}
	public String getGame_date() {
		return game_date;
	}
	public void setGame_date(String game_date) {
		this.game_date = game_date;
	}
	public String getGame_location() {
		return game_location;
	}
	public void setGame_location(String game_location) {
		this.game_location = game_location;
	}
	public String getGame_title() {
		return game_title;
	}
	public void setGame_title(String game_title) {
		this.game_title = game_title;
	}
	public String getGame_contents() {
		return game_contents;
	}
	public void setGame_contents(String game_contents) {
		this.game_contents = game_contents;
	}
	public String getGame_fdate() {
		return game_fdate;
	}
	public void setGame_fdate(String game_fdate) {
		this.game_fdate = game_fdate;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	
	

	

	
	
}
