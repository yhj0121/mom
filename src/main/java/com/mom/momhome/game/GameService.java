package com.mom.momhome.game;

import java.util.List;


public interface GameService {
    void insert(GameDto dto);
	GameDto getView(String id);
	void delete(int id);
	void update(GameDto dto);
	List<GameDto> getList(GameDto dto);
	int getTotal(GameDto dto);
//	Character joinornot(MatchingJoinDto dto);
//	void insert(MatchingJoinDto dto);



}
