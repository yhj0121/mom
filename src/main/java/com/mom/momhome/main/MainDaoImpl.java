package com.mom.momhome.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.game.GameDto;
import com.mom.momhome.mercenary.MercenaryDto;

@Repository("mainDao")
public class MainDaoImpl implements MainDao{

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<MercenaryDto> getMercenaryList(MercenaryDto dto) {
		return sm.selectList("Main_getMercenaryList", dto );
	}

	@Override
	public List<GameDto> getGameList(GameDto dto) {
		return sm.selectList("Main_getGameList", dto );
	}

}
