package com.mom.momhome.game;

import java.util.List;

import com.mom.momhome.gamejoin.GameJoinDto;
import com.mom.momhome.gamejoin.GameJoinProcDto;


public interface GameService {
    void insert(GameDto dto);
	GameDto getView(String game_key);
	void delete(String game_key);
	void update(GameDto dto);
	List<GameDto> getList(GameDto dto);
	int getTotal(GameDto dto);

	
	void gameinsertJoin(GameJoinDto dto);
	void updateJoin(GameJoinProcDto dto);
	List<GameJoinDto> getListJoin(GameJoinDto dto);//gamejoin테이블 정보
	GameDto getCityList(String user_key);
	GameDto getMembershipUserkey(String user_key);
	int GetCount(GameJoinDto dto); //중복 신청 방지
	int getMatchingjoincount(GameJoinDto gamejoinDto); //result 갯수 확인

	int getLineupCount(String game_key, String team_side);
	String getGameJoinResultProc(String game_key, String team_key);
}
