package com.mom.momhome.gamejoin;

import java.util.List;


public interface GameJoinDao {
		void gameinsertJoin(GameJoinDto dto);
		void updateJoin(GameJoinDto dto);
		List<GameJoinDto> getListJoin(GameJoinDto dto);
		int GetCount(GameJoinDto dto);
		String getTeamkey(String user_key);
		String getGameJoinResult(GameJoinDto gameJoinDto);
		int getMatchingjoincount(GameJoinDto gamejoinDto);

}
