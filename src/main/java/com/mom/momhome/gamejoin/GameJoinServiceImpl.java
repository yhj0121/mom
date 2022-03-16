package com.mom.momhome.gamejoin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.mercenary.MercenaryDto;

@Service("gamejoinService")
public class GameJoinServiceImpl implements GameJoinService{
	
	@Resource
	GameJoinDao gamejoinDao;

	@Override
	public List<GameJoinDto> getMatchTeamList(GameJoinDto dto) {
		return gamejoinDao.getMatchTeamList(dto);
	}

	@Override
	public int getMatchTotal(GameJoinDto dto) {
		return gamejoinDao.getMatchTotal(dto);
	}
	
}
