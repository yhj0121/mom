package com.mom.momhome.game;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.gamejoin.GameJoinDao;
import com.mom.momhome.gamejoin.GameJoinDto;
import com.mom.momhome.membership.MembershipDto;



@Service("gameService")
public class GameServiceImp implements GameService {
	@Resource(name="gameDao")
	GameDao dao;
	
	@Resource(name="gamejoinDao")
	GameJoinDao gamejoindao;
//

	
	@Override
	public void insert(GameDto dto) {
			dao.insert(dto);
	}

	@Override
	public GameDto getView(String game_key) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return dao.getList(dto);
	}

	@Override
	public int getTotal(GameDto dto) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return dao.getCityList(user_key);
	}

	@Override
	public GameDto teamkeySelect(String user_key) {
		// TODO Auto-generated method stub
		return dao.teamkeySelect(user_key);
	}

	@Override
	public int GetCount(GameJoinDto dto) {
		// TODO Auto-generated method stub
		return gamejoindao.GetCount(dto);
	}






}
