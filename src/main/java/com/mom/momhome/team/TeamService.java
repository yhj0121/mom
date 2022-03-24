package com.mom.momhome.team;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.member.MemberDto;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.teamjoin.TeamjoinDto;

public interface TeamService {
	
	public void insert(TeamDto dto, MembershipDto mdto, HttpServletRequest request); //팀 생성 *수정함*
	
	boolean isDuplicate(TeamDto dto); //팀 이름 중복확인
	
	List<BaseDto> getCityList(BaseDto dto); //지역 리스트 
	
	List<TeamDto> getTeamList(TeamDto dto); //팀 조회 리스트
	
	int getTeamTotal(TeamDto dto);
	
	TeamDto getTeamView(TeamDto dto);
	
	List<TeamDto> getTeamViewList(TeamDto dto);
	
	void team_InsertMembership(MembershipDto dto);//멤버쉽
	
	void membershipInsert( MembershipDto dto ); //멤버십 생성
	
	void Teamjoin_teamjoinInsert(TeamjoinDto dto); //팀 가입 신청
	
	public int getCountForCheckingDuplicate(TeamjoinDto jdto);
}
