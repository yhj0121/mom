package com.mom.momhome.game;

import java.util.List;

import com.mom.momhome.common.BaseDto;

public interface GameDao {
    void insert(GameDto dto);
	GameDto getView(String game_key);
	void delete(String game_key);
	void update(GameDto dto);
	List<GameDto> getList(GameDto dto);
	int getTotal(GameDto dto);
	
	String getCityList(String team_key);
}
