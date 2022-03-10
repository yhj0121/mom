package com.mom.momhome.mercenaryjoin;

import java.util.List;

public interface MercenaryjoinDao {
	void insertJoin(MercenaryjoinDto dto);
	List<MercenaryjoinDto> getApplicantsList(MercenaryjoinDto dto);
	void updateJoin(MercenaryjoinDto dto);
	
}
