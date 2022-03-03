package com.mom.momhome.lineup;

public class LineupGameDto {

	int game_key	= 0;
	int team_key	= 0;
	String game_date = "";
	String game_location = "";
	String game_title = "";
	String game_contents = "";
	String game_fdate = "";
	
	public int getGame_key() {
		return game_key;
	}
	public void setGame_key(int game_key) {
		this.game_key = game_key;
	}
	public int getTeam_key() {
		return team_key;
	}
	public void setTeam_key(int team_key) {
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
	
}
