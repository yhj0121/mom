package com.mom.momhome.lineup;

import java.util.List;
import java.util.Map;

public interface LineupService {
	List<LineupDto> getList(LineupDto dto);
	List<LineupPlayerDto> getPlayerList(String teamkey);
    LineupPlayerDto getPlayer(String userkey);
    
	void delete(LineupDto dto);
	void update(LineupDto dto);
	
	void saveLineups(Map<String, Object> jsonDatas);
	
	void insert_userDummy(LineupPlayerDto dto);
	void insert_teamDummy(LineupTeamDto dto);
	void insert_membershipDummy(LineupMembershipDto dto);
	void insert_gameDummy(LineupGameDto dto);
}
