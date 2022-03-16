package com.mom.momhome.gamejoin;

import java.util.List;

import com.mom.momhome.mercenary.MercenaryDto;


public interface GameJoinDao {
		void gameinsertJoin(GameJoinDto dto);
		void updateResultproc(GameJoinProcDto dto);
		List<GameJoinDto> getListJoin(GameJoinDto dto);
		int GetCount(GameJoinDto dto);
		String getTeamkey(String user_key);
		String getGameJoinResult(GameJoinDto gameJoinDto);
		int getMatchingjoincount(GameJoinDto gamejoinDto);

		//감독권한 팀 리스트 가져오기
			List<GameJoinDto> getMatchTeamList ( GameJoinDto dto );
			int getMatchTotal(GameJoinDto dto);

}
