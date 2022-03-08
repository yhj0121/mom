package com.mom.momhome.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.game.GameDto;
import com.mom.momhome.mercenary.MercenaryDto;

@Service("mainService")
public class MainServiceImpl implements MainService {
	@Resource(name="mainDao")
	MainDao mainDao;

	@Override
	public List<MercenaryDto> getMercenaryList(MercenaryDto dto) {
		return mainDao.getMercenaryList(dto);
	}

	@Override
	public List<GameDto> getGameList(GameDto dto) {
		return mainDao.getGameList(dto);
	}
	
}
