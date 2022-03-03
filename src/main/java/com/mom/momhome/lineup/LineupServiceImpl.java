package com.mom.momhome.lineup;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("lineupService")
public class LineupServiceImpl implements LineupService{

	@Resource(name="lineupDao")
	LineupDao lineupDao;

	@Override
	public List<LineupDto> getList(LineupDto dto) {
		return lineupDao.getList(dto);
	}

	@Override
	public List<LineupPlayerDto> getPlayerList(LineupDto dto) {
		return lineupDao.getPlayerList(dto);
	}

	@Override
	public void insert(LineupDto dto) {
		lineupDao.insert(dto);
	}

	@Override
	public void delete(String key) {
		lineupDao.delete(key);
	}

	@Override
	public void update(LineupDto dto) {
		lineupDao.update(dto);
	}

	@Override
	public void insert_userDummy(LineupPlayerDto dto) {
		lineupDao.insert_userDummy(dto);
	}
	
	@Override
	public void insert_teamDummy(LineupTeamDto dto) {
		lineupDao.insert_teamDummy(dto);
	}
	
	@Override
	public void insert_membershipDummy(LineupMembershipDto dto) {
		lineupDao.insert_membershipDummy(dto);
	}
	
	@Override
	public void insert_gameDummy(LineupGameDto dto) {
		lineupDao.insert_gameDummy(dto);
	}
}
