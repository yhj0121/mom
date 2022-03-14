package com.mom.momhome.game;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.gamejoin.GameJoinDao;
import com.mom.momhome.gamejoin.GameJoinDto;
import com.mom.momhome.lineup.LineupDao;
import com.mom.momhome.lineup.LineupDto;



@Service("gameService")
public class GameServiceImp implements GameService {
	@Resource(name="gameDao")
	GameDao dao;
	
	@Resource(name="gamejoinDao")
	GameJoinDao gamejoindao;
	
	@Resource(name="lineupDao")
	LineupDao lineupDao;
	
	@Override
	public void insert(GameDto dto) {
		dao.insert(dto);
	}

	@Override
	public GameDto getView(String game_key) {
		return dao.getView(game_key);
	}

	@Override
	public void delete(String game_key) {
		dao.delete(game_key);
	}

	@Override
	public void update(GameDto dto) {
		dao.update(dto);
	}

	@Override
	public List<GameDto> getList(GameDto dto) {
		return dao.getList(dto);
	}

	@Override
	public int getTotal(GameDto dto) {
		return dao.getTotal(dto);
	}

	@Override
	public void gameinsertJoin(GameJoinDto dto) {
		String team_key = gamejoindao.getTeamkey(dto.getUser_key());
		dto.setTeam_key(team_key);
		gamejoindao.gameinsertJoin(dto);
	}

	@Override
	public void updateJoin(GameJoinDto dto) {
		gamejoindao.updateJoin(dto);		
	}

	@Override
	public List<GameJoinDto> getListJoin(GameJoinDto dto) {
		return gamejoindao.getListJoin(dto);
	}

	@Override
	public GameDto getCityList(String user_key) {
		return dao.getCityList(user_key);
	}

	@Override
	public GameDto getMembershipUserkey(String user_key) {
		return dao.getMembershipUserkey(user_key);
	}

	@Override
	public int GetCount(GameJoinDto dto) {
		return gamejoindao.GetCount(dto);
	}

	@Override
	public int getMatchingjoincount(GameJoinDto gamejoinDto) {
		return gamejoindao.getMatchingjoincount(gamejoinDto);
	}

	@Override
	public int getLineupCount(String game_key, String team_side) {
		LineupDto dto = new LineupDto();
		dto.setGame_key(game_key);
		dto.setTeam_side(team_side);
		return lineupDao.getLineupCount(dto);
	}

	@Override
	public String getGameJoinResultProc(String game_key, String team_key)
	{
		GameJoinDto dto = new GameJoinDto();
		dto.setGame_key(game_key);
		dto.setTeam_key(team_key);
		return gamejoindao.getGameJoinResult(dto);
	}



}
