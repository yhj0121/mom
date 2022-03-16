package com.mom.momhome.gamejoin;

import java.util.List;

import com.mom.momhome.mercenary.MercenaryDto;

public interface GameJoinService {

	//감독권한 팀 리스트 가져오기
		List<GameJoinDto> getMatchTeamList( GameJoinDto dto );
		int getMatchTotal(GameJoinDto dto);
}
