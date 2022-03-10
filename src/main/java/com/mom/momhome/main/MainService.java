package com.mom.momhome.main;

import java.util.List;

import com.mom.momhome.cscenter.CSCenterDto;
import com.mom.momhome.game.GameDto;
import com.mom.momhome.mercenary.MercenaryDto;
import com.mom.momhome.team.TeamDto;

public interface MainService {
	List<MercenaryDto> getMercenaryList(MercenaryDto dto);
	List<GameDto> getGameList(GameDto dto);
	List<TeamDto> getTeamList(TeamDto dto);
	List<CSCenterDto> getCScenterList(CSCenterDto dto);
}
