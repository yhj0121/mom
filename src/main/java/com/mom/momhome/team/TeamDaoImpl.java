package com.mom.momhome.team;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.common.BaseDto;

@Repository("teamDao")
public class TeamDaoImpl implements TeamDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<TeamDto> getList(TeamDto dto) {
		
		return sm.selectList("teamList", dto);
	}

	@Override
	public void insert(TeamDto dto) {
		sm.insert("teamWrite", dto);
		
	}

	@Override
	public int getTotal(TeamDto dto) {
		
		return sm.selectOne("Team_getTotal", dto);
	}

	@Override
	public List<BaseDto> getCityList(BaseDto dto) {
		
		return sm.selectList("getCityList", dto);
	}

	
}
