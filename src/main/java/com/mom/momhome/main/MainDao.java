package com.mom.momhome.main;

import java.util.List;

import com.mom.momhome.game.GameDto;
import com.mom.momhome.mercenary.MercenaryDto;

public interface MainDao {
	List<MercenaryDto> getMercenaryList(MercenaryDto dto);
	List<GameDto> getGameList(GameDto dto);
}
