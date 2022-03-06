package com.mom.momhome.team;

import java.util.List;

import com.mom.momhome.common.BaseDto;

public interface TeamDao {
	
	void insert(TeamDto dto); //팀 생성 
	
	boolean isDuplicate(TeamDto dto); //팀 이름 중복확인
	
	List<BaseDto> getCityList(BaseDto dto); //지역 리스트 
	
	
}
