package com.mom.momhome.teamjoin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("teamjoinDao")
public class TeamjoinDaoImpl implements TeamjoinDao {
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<TeamjoinDto> getTeamjoinList(TeamjoinDto jdto) {
		return sm.selectList("Teamjoin_teamjoinList", jdto );
	}

	@Override
	public int getTeamjoinTotal(TeamjoinDto jdto) {
		return sm.selectOne("Teamjoin_teamjoinGetTotal", jdto);
	}

	@Override
	public TeamjoinDto teamAccept( TeamjoinDto jdto ) {
		return sm.selectOne("Teamjoin_teamjoinAccept",jdto);
	}

	@Override
	public TeamjoinDto teamRefuse(TeamjoinDto jdto) {
		return sm.selectOne("Teamjoin_teamjoinRefuse",jdto);
	}

	@Override
	public TeamjoinDto teamoutAccept(TeamjoinDto jdto) {
		return sm.selectOne("Teamjoin_teamoutAccept",jdto);
	}

	@Override
	public TeamjoinDto teamoutRefuse(TeamjoinDto jdto) {
		return sm.selectOne("Teamjoin_teamoutRefuse",jdto);
	}

	@Override
	public List<TeamjoinDto> getMyTeamList(TeamjoinDto jdto) {
		return sm.selectList("Teamjoin_teamjoinedList",jdto);
	}

	@Override
	public TeamjoinDto teamkickout(TeamjoinDto jdto) {
		return sm.selectOne("Teamjoin_teamkickout", jdto);
	}
}
