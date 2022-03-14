package com.mom.momhome.lineup;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.game.GameDto;

@Repository("lineupDao")
public class LineupDaoImpl implements LineupDao{

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	//
	public List<LineupDto> getList(GameDto dto) {
		return sm.selectList("Lineup_getList", dto);
	}

	@Override
	public List<LineupPlayerDto> getPlayerList(String teamkey) {
		return sm.selectList("Lineup_getPlayerList", teamkey);
	}
    
    @Override
    public LineupPlayerDto getPlayer(String userkey) {
        
        return sm.selectOne("Lineup_getPlayer", userkey);
    }

	@Override
	public void insert(Map<String, Object> paramMap) {
		sm.insert("Lineup_insert", paramMap);
	}

	@Override
	public void delete(LineupDto dto) {
		sm.delete("Lineup_delete", dto);
	}

	@Override
	public void update(LineupDto dto) {
		sm.update("Lineup_update", dto);
	}

	@Override
	public void insert_userDummy(LineupPlayerDto dto) {
		sm.insert("Lineup_insertUserData", dto);
	}
	
	@Override
	public void insert_teamDummy(LineupTeamDto dto) {
		sm.insert("Lineup_insertTeamData", dto);
	}
	
	@Override
	public void insert_membershipDummy(LineupMembershipDto dto) {
		sm.insert("Lineup_insertMemberShipData", dto);
	}
	
	@Override
	public void insert_gameDummy(LineupGameDto dto) {
		sm.insert("Lineup_insertGameData", dto);
	}
	
	@Override
	public Integer getLineupCount(LineupDto lineupDto)
	{
		return sm.selectOne("Lineup_getCount", lineupDto);
	}
}
