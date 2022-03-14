package com.mom.momhome.team;

import java.util.List;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.teamjoin.TeamjoinDto;
import com.mom.momhome.member.MemberDto;

public interface TeamDao {
	
	String insert(TeamDto dto); //팀 생성 
	
	boolean isDuplicate(TeamDto dto); //팀 이름 중복확인
	
	List<BaseDto> getCityList(BaseDto dto); //지역 리스트 
	
	List<TeamDto> getTeamList(TeamDto dto); //팀 조회 리스트
	
	TeamDto getTeamView(TeamDto dto); //팀 상세보기
	
	int getTeamTotal(TeamDto dto);
	
	void team_InsertMembership(MembershipDto dto); //멤버쉽
	
	void membershipInsert( MembershipDto dto ); //멤버십 생성
	
	void teamJoin(TeamjoinDto dto); //팀 가입 신청
}
