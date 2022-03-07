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

	@Override //팀 생성
	public void insert(TeamDto dto) {
		sm.insert("Team_insert", dto);
		
	}

	@Override // 팀 이름 중복 검사하기
	public boolean isDuplicate(TeamDto dto) {
		int cnt = sm.selectOne("Team_isDuplicate", dto);
		if(cnt == 0)
			return false;
		else
			return true;
	}

	@Override //지역 정보
	public List<BaseDto> getCityList(BaseDto dto) {
		
		return sm.selectList("getCityList", dto);
	}

	

	@Override
	public void team_InsertMembership(TeamMembershipDto dto) {
		sm.insert("Team_insertMembership", dto);
		
	}
	

	
}
