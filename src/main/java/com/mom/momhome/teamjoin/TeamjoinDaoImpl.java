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
}
