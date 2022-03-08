package com.mom.momhome.gamejoin;

import java.util.List;


public interface GameJoinDao {
		void insertJoin(GameJoinDto dto);
		void updateJoin(GameJoinDto dto);
		List<GameJoinDto> getListJoin(GameJoinDto dto);
}
