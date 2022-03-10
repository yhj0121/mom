package com.mom.momhome.mercenary;

import java.util.List;

public interface MercenaryDao {
	List<MercenaryDto> getList(MercenaryDto dto);
	void insert(MercenaryDto dto);
	void delete(String mercenary_key);
	void update(MercenaryDto dto);
	MercenaryDto getView(String mercenary_key);
	int getTotal(MercenaryDto dto);
	int checkDuplicate(MercenaryDto dto);
	
	List<MercenaryDto> getGameList(String user_key);
	int getMsCount(String game_key);
}
