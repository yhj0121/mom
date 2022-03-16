package com.mom.momhome.mercenaryjoin;

import java.util.List;

public interface MercenaryjoinDao {
	void insertJoin(MercenaryjoinDto dto);
	List<MercenaryjoinDto> getApplicantsList(MercenaryjoinDto dto);
	void updateJoin(MercenaryjoinDto dto);
	int mercenaryjoinDuplicate(MercenaryjoinDto dto);
	int getApproveCount(String mercenary_key);
	List<MercenaryjoinDto> getMyInfo(MercenaryjoinDto dto);
}
