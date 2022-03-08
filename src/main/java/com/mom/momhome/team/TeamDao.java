package com.mom.momhome.team;

import java.util.List;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.membership.MembershipDto;

public interface TeamDao {
	
	String insert(TeamDto dto); //팀 생성 
	
	boolean isDuplicate(TeamDto dto); //팀 이름 중복확인
	
	List<BaseDto> getCityList(BaseDto dto); //지역 리스트 
	
	void team_InsertMembership(MembershipDto dto); //멤버쉽
	
	void membershipInsert( MembershipDto dto ); //멤버십 생성
	
	
}
