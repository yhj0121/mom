package com.mom.momhome.lineup;

public class LineupDto {

	String lineup_key = "";	
	String user_key	= "";
	String team_key	= "";
	String game_key	= "";
	String code_key	= "";
	String team_side = "";
	String lineup_index = "";
	String mercenary_state = "";

	LineupPlayerDto playerDto = new LineupPlayerDto();
	
	public String getMercenary_state() {
		return mercenary_state;
	}

	public void setMercenary_state(String mercenary_state) {
		this.mercenary_state = mercenary_state;
	}
	
	public String getLineup_key() {
		return lineup_key;
	}

	public void setLineup_key(String lineup_key) {
		this.lineup_key = lineup_key;
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

	public String getGame_key() {
		return game_key;
	}

	public void setGame_key(String game_key) {
		this.game_key = game_key;
	}

	public String getCode_key() {
		return code_key;
	}

	public void setCode_key(String code_key) {
		this.code_key = code_key;
	}

	public String getTeam_side() {
		return team_side;
	}

	public void setTeam_side(String team_side) {
		this.team_side = team_side;
	}

	public LineupPlayerDto getPlayerDto() {
		return playerDto;
	}

	public void setPlayerDto(LineupPlayerDto playerDto) {
		this.playerDto = playerDto;
	}

	public String getLineup_index() {
		return lineup_index;
	}

	public void setLineup_index(String lineup_index) {
		this.lineup_index = lineup_index;
	}

	
	
}
