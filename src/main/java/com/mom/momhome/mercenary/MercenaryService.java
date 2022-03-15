package com.mom.momhome.mercenary;

import java.util.List;

import com.mom.momhome.mercenaryjoin.MercenaryjoinDto;

public interface MercenaryService {
	List<MercenaryDto> getList(MercenaryDto dto);
	void insert(MercenaryDto dto);
	void delete(String mercenary_key);
	void update(MercenaryDto dto);
	MercenaryDto getView(String mercenary_key);
	int getTotal(MercenaryDto dto);
	int checkDuplicate(MercenaryDto dto);
	List<MercenaryDto> getGameList(String user_key);
	
	void insertJoin(MercenaryjoinDto dto);
	List<MercenaryjoinDto> getApplicantsList(MercenaryjoinDto dto);
	void updateJoin(MercenaryjoinDto dto);
	int getMsCount(String game_key);
	int mercenaryjoinDuplicate(MercenaryjoinDto dto);
	int getApproveCount(String mercenary_key);
	List<MercenaryjoinDto> getMyInfo(MercenaryjoinDto dto);
	
}
