package com.mom.momhome.mercenaryjoin;

import java.util.List;

import com.mom.momhome.mercenary.MercenaryDto;

public interface MercenaryjoinDao {
	void insertJoin(MercenaryjoinDto dto);
	List<MercenaryjoinDto> getApplicantsList(MercenaryjoinDto dto);
}
