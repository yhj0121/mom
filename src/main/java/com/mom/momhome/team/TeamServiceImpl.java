package com.mom.momhome.team;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.membership.MembershipDao;
import com.mom.momhome.membership.MembershipDto;

@Service("teamService")
public class TeamServiceImpl implements TeamService{
	
	@Resource(name="teamDao")
	TeamDao teamDao;
	
	@Resource(name="membershipDao")//membershipDao 사용 추가 및 import
	MembershipDao membershipDao;

	@Override //insert 변경 *수정함*
	public void insert(TeamDto dto, MembershipDto mdto, HttpServletRequest request) {
		String team_key = teamDao.insert(dto);
		System.out.println("dto: " +dto.toString());
		  
		 
		mdto.setUser_key(dto.getUser_key());
		mdto.setTeam_key( team_key );
		mdto.setMembership_role("1");
		System.out.println("userkey: "+mdto.getUser_key());
		System.out.println("getTeam_key: "+dto.getTeam_key());
		membershipDao.insertMembership(mdto);
		
		HttpSession session = request.getSession();
		 session.setAttribute("membership_role", mdto.getMembership_role());
		
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
	public void team_InsertMembership(MembershipDto dto) {
		teamDao.team_InsertMembership(dto);
		
	}

	@Override
	public void membershipInsert(MembershipDto dto) {
		teamDao.membershipInsert(dto);
	}

	@Override
	public List<TeamDto> getTeamList(TeamDto dto) {
		
		return teamDao.getTeamList(dto);
	}
}
