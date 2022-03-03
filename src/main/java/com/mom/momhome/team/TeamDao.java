package com.mom.momhome.team;

import java.util.List;

import com.mom.momhome.common.BaseDto;

public interface TeamDao {
	List<TeamDto> getList(TeamDto dto);
	void insert(TeamDto dto);
	int getTotal(TeamDto dto);
	List<BaseDto> getCityList(BaseDto dto);
	
	
}
