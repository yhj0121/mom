package com.mom.momhome.gamejoin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("gamejoinDao")
public class GameJoinDaoImp implements GameJoinDao {
	
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public void gameinsertJoin(GameJoinDto dto) {
				sm.insert("GameJoin_insert", dto);
	}

	@Override
	public void updateJoin(GameJoinDto dto) {
			sm.update("GameJoin_update",dto);
	}

	@Override
	public List<GameJoinDto> getListJoin(GameJoinDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("GameJoin_getList", dto);
	}

}
