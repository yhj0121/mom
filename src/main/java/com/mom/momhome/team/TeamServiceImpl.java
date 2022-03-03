package com.mom.momhome.team;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.common.BaseDto;

@Service("teamService")
public class TeamServiceImpl implements TeamService{
	
	@Resource(name="teamDao")
	TeamDao teamDao;

	@Override
	public List<TeamDto> getList(TeamDto dto) {
		
		return teamDao.getList(dto);
	}

	@Override
	public void insert(TeamDto dto) {
		
		teamDao.insert(dto);
		
	}

	@Override
	public int getTotal(TeamDto dto) {
		
		return teamDao.getTotal(dto);
	}

	@Override
	public List<BaseDto> getCityList(BaseDto dto) {
		
		return teamDao.getCityList(dto);
	}
	

}
