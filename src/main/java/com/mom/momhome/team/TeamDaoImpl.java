package com.mom.momhome.team;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.member.MemberDto;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.teamjoin.TeamjoinDto;

@Repository("teamDao")
public class TeamDaoImpl implements TeamDao {

	@Autowired
	SqlSessionTemplate sm;

	@Override //팀 생성
	public String insert(TeamDto dto) {

		sm.insert("team_insert", dto);
		String id = sm.selectOne("lastid");
		System.out.println("스트링 아이디: "+id);
		return id;
	}

	@Override // 팀 이름 중복 검사하기
	public boolean isDuplicate(TeamDto dto) {
		int cnt = sm.selectOne("Team_isDuplicate", dto);
		if(cnt == 0)
			return false;
		else
			return true;
	}

	@Override //지역 정보 가져오기
	public List<BaseDto> getCityList(BaseDto dto) {
		
		return sm.selectList("getCityList", dto);
	}

	

	@Override
	public void team_InsertMembership(MembershipDto dto) {
		sm.insert("Team_insertMembership", dto);
		
	}

	@Override
	public void membershipInsert(MembershipDto dto) {
		sm.selectOne("Membership_insert", dto);
	}

	@Override
	public List<TeamDto> getTeamList(TeamDto dto) {
		
		return sm.selectList("getTeamList", dto);
	}

	@Override
	public int getTeamTotal(TeamDto dto) {
		
		return sm.selectOne("getTeamTotal", dto);
	}

	@Override
	public TeamDto getTeamView(TeamDto dto) {
		
		return sm.selectOne("getTeamView", dto);
	}

	@Override
	public void Teamjoin_teamjoinInsert(TeamjoinDto dto) {
		
		sm.insert("Teamjoin_teamjoinInsert", dto);

	}

	@Override
	public List<TeamDto> getTeamViewList(TeamDto dto) {
		
		return sm.selectList("getTeamViewList", dto);
	}



	

	
	


	
	

	
}
