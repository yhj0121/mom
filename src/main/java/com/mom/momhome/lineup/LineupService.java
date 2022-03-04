package com.mom.momhome.lineup;

import java.util.List;

public interface LineupService {
	List<LineupDto> getList(LineupDto dto);
	List<LineupPlayerDto> getPlayerList(String teamkey);
    LineupPlayerDto getPlayer(String userkey);
    
	void insert(LineupDto dto);
	void delete(String key);
	void update(LineupDto dto);
	
	void insert_userDummy(LineupPlayerDto dto);
	void insert_teamDummy(LineupTeamDto dto);
	void insert_membershipDummy(LineupMembershipDto dto);
	void insert_gameDummy(LineupGameDto dto);
}
