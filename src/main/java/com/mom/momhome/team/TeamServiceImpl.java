package com.mom.momhome.team;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.membership.MembershipDto;

@Service("teamService")
public class TeamServiceImpl implements TeamService{
	
	@Resource(name="teamDao")
	TeamDao teamDao;

	@Override
	public String insert(TeamDto dto) {
		return teamDao.insert(dto);
	}

	@Override
	public boolean isDuplicate(TeamDto dto) {
		
		return teamDao.isDuplicate(dto);
	}

	@Override
	public List<BaseDto> getCityList(BaseDto dto) {
		
		return teamDao.getCityList(dto);
	}

	
	@Override
	public void team_InsertMembership(TeamMembershipDto dto) {
		teamDao.team_InsertMembership(dto);
		
	}

	@Override
	public void membershipInsert(MembershipDto dto) {
		teamDao.membershipInsert(dto);
	}
}
