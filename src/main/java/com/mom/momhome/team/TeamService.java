package com.mom.momhome.team;

import java.util.List;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.member.MemberDto;

public interface TeamService {
	
	void insert(TeamDto dto); //팀 생성 
	
	boolean isDuplicate(TeamDto dto); //팀 이름 중복확인
	
	List<BaseDto> getCityList(BaseDto dto); //지역 리스트 
	
	void team_InsertMembership(TeamMembershipDto dto);//멤버쉽
}
