package com.mom.momhome.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.cscenter.CSCenterDto;
import com.mom.momhome.game.GameDto;
import com.mom.momhome.mercenary.MercenaryDto;
import com.mom.momhome.team.TeamDto;

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

	@Override
	public List<CSCenterDto> getCScenterList(CSCenterDto dto) {
		return mainDao.getCScenterList(dto);
	}

	@Override
	public List<TeamDto> getTeamList(TeamDto dto) {
		return mainDao.getTeamList(dto);
	}
	
}
