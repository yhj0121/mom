package com.mom.momhome.team;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.membership.MembershipDao;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.teamjoin.TeamjoinDto;
import com.mom.momhome.member.MemberDto;


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
		  
		//팀 생성과 함께 membership정보 DB에 입력하기
		mdto.setUser_key(dto.getUser_key());
		mdto.setTeam_key( team_key );
		mdto.setMembership_role("1"); //팀 생성시 membership db에 membership_role 1입력. 1)감독, 2)선수 권한부여
		System.out.println("userkey: "+mdto.getUser_key());
		System.out.println("getTeam_key: "+dto.getTeam_key());
		membershipDao.insertMembership(mdto);
		
		mdto = membershipDao.getMembership(mdto.getUser_key());
		
		HttpSession session = request.getSession(); //팀 중복 생성 막기 위해서 membership_role 세션에 저장하기
		session.setAttribute("membership_role", mdto.getMembership_role());
        session.setAttribute("membershipDto", mdto);
    
	}
	
	@Override
	public List<TeamDto> getTeamList(TeamDto dto) {
		
		return teamDao.getTeamList(dto);
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
	public int getTeamTotal(TeamDto dto) {
		
		return teamDao.getTeamTotal(dto);
	}

	@Override
	public TeamDto getTeamView(TeamDto dto) {
		
		return teamDao.getTeamView(dto);
	}

	@Override
	public void Teamjoin_teamjoinInsert(TeamjoinDto dto) {
		
		teamDao.Teamjoin_teamjoinInsert(dto);
		
	}

	@Override
	public List<TeamDto> getTeamViewList(TeamDto dto) {
		
		return teamDao.getTeamViewList(dto);
	}


}
