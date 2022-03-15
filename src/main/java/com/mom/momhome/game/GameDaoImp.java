package com.mom.momhome.game;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.gamejoin.GameJoinProcDto;

@Repository("gameDao")
public class GameDaoImp implements GameDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public void insert(GameDto dto) {
		sm.insert("game_insert", dto);
	}

	@Override
	public GameDto getView(String game_key) {		
		return sm.selectOne("game_view", game_key);
	}

	@Override
	public void update(GameDto dto) {
		sm.update("game_update", dto);
		
	}

	@Override
	public List<GameDto> getList(GameDto dto) {
		return sm.selectList("game_list", dto);
	}

	@Override
	public int getTotal(GameDto dto) {
		return sm.selectOne("game_getTotal",dto);
	}

	@Override
	public void delete(String game_key) {
		sm.delete("game_delete",game_key);
	}

	@Override
	public GameDto getCityList(String user_key) {
		return sm.selectOne("game_cityList", user_key);
	}

	@Override
	public GameDto getMembershipUserkey(String user_key) {
		return sm.selectOne("game_getMembershipUserkey", user_key);
	}

	@Override
	public void updateGameComplete(GameJoinProcDto dto) {
	    sm.update("game_completeUpdate", dto);
	}


}





