package com.mom.momhome.game;

import java.util.List;


public interface GameService {
    void insert(GameDto dto);
	GameDto getView(String game_key);
	void delete(String game_key);
	void update(GameDto dto);
	List<GameDto> getList(GameDto dto);
	int getTotal(GameDto dto);
//	Character joinornot(MatchingJoinDto dto);
//	void insert(MatchingJoinDto dto);



}
