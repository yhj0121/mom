package com.mom.momhome.game;

import java.util.List;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.gamejoin.GameJoinDto;


public interface GameService {
    void insert(GameDto dto);
	GameDto getView(String game_key);
	void delete(String game_key);
	void update(GameDto dto);
	List<GameDto> getList(GameDto dto);
	int getTotal(GameDto dto);

	
	void gameinsertJoin(GameJoinDto dto);
	void updateJoin(GameJoinDto dto);
	List<GameJoinDto> getListJoin(GameJoinDto dto);//gamejoin테이블 정보
	String getCityList(String team_key);



}
