package com.mom.momhome.game;

import java.util.List;



import javax.annotation.Resource;

import org.springframework.stereotype.Service;



@Service("gameService")
public class GameServiceImp implements GameService {
	@Resource(name="gameDao")
	GameDao dao;
//
//	@Resource(name="matchingJoin")
//	MatchingJoinDao matchingJoinDao;
	
	@Override
	public void insert(GameDto dto) {
			dao.insert(dto);
	}

	@Override
	public GameDto getView(String id) {
		// TODO Auto-generated method stub
		return dao.getView(id);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
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

//	@Override
//	public Character joinornot(MatchingJoinDto dto) {
//		// TODO Auto-generated method stub
//		return matchingJoinDao.joinornot(dto);
//	}
//
//	@Override
//	public void insert(MatchingJoinDto dto) {
//		matchingJoinDao.insert(dto);		
//	}

}
