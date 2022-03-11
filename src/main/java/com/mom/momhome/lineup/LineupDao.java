package com.mom.momhome.lineup;

import java.util.List;
import java.util.Map;

import com.mom.momhome.game.GameDto;

public interface LineupDao {
	
	//라인업정보 볼때 팀키+팀사이드로 해당하는 라인업 레코드 전부 가져와서 리스트로 반환.
	List<LineupDto> getList(GameDto dto);

	//라인업에 선수 등록을위해 클릭시 해당팀 선수리스트 보여주기 위해.
	List<LineupPlayerDto> getPlayerList(String teamkey);
	
    LineupPlayerDto getPlayer(String userkey);
    
	void insert(Map<String, Object> paramMap);
	void delete(LineupDto dto);
	void update(LineupDto dto);
	
	
	void insert_userDummy(LineupPlayerDto dto);
	void insert_teamDummy(LineupTeamDto dto);
	void insert_membershipDummy(LineupMembershipDto dto);
	void insert_gameDummy(LineupGameDto dto);
}
