package com.mom.momhome.gamejoin;

import java.util.List;


public interface GameJoinDao {
		void gameinsertJoin(GameJoinDto dto);
		void updateJoin(GameJoinDto dto);
		List<GameJoinDto> getListJoin(GameJoinDto dto);
		int Gamejoinduplicate(String team_key);
}
