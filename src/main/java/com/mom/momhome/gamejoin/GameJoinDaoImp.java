package com.mom.momhome.gamejoin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.common.StringUtil;


@Repository("gamejoinDao")
public class GameJoinDaoImp implements GameJoinDao {
	
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public void gameinsertJoin(GameJoinDto dto) {
		sm.insert("GameJoin_insert", dto);
	}

	@Override
	public void updateJoin(GameJoinProcDto dto) {
		sm.update("Gamejoin_update",dto);
	}

	@Override
	public List<GameJoinDto> getListJoin(GameJoinDto dto) {
		return sm.selectList("GameJoin_getList", dto);
	}

	@Override
	public int GetCount(GameJoinDto dto) {
		return sm.selectOne("Gamejoin_getCount",dto);
	}

	@Override
	public String getTeamkey(String user_key) {
		return sm.selectOne("Gamejoin_getTeamkey", user_key);
	}

	@Override
	public String getGameJoinResult(GameJoinDto gameJoinDto) {
		return StringUtil.nullToValue(sm.selectOne("GameJoin_getGameJoinResult", gameJoinDto), "1");
	}

	@Override
	public int getMatchingjoincount(GameJoinDto gamejoinDto) {
		return sm.selectOne("GameJoin_getMatchingjoin", gamejoinDto);
	}

}
