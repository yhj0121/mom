package com.mom.momhome.lineup;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lineupDao")
public class LineupDaoImpl implements LineupDao{

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	//
	public List<LineupDto> getList(LineupDto dto) {
		return sm.selectList("Lineup_getList", dto);
	}

	@Override
	public List<LineupPlayerDto> getPlayerList(LineupDto dto) {
		return sm.selectList("Lineup_getPlayersList", dto);
	}
    
    @Override
    public LineupPlayerDto getPlayer(String userkey) {
        
        return sm.selectOne("Lineup_getPlayer", userkey);
    }

	@Override
	public void insert(LineupDto dto) {
		sm.insert("Lineup_insert", dto);
	}

	@Override
	public void delete(String key) {
		sm.delete("Lineup_delete", key);
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
}
