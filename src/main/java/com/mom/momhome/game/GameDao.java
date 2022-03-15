package com.mom.momhome.game;

import java.util.List;

import com.mom.momhome.gamejoin.GameJoinProcDto;

public interface GameDao {
    void insert(GameDto dto);
	GameDto getView(String game_key);
	void delete(String game_key);
	void update(GameDto dto);
	List<GameDto> getList(GameDto dto);
	int getTotal(GameDto dto);
	
	GameDto getCityList(String user_key);
	GameDto getMembershipUserkey(String user_key);
	void updateGameComplete(GameJoinProcDto dto);
}
