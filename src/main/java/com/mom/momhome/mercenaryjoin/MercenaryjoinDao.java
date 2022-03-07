package com.mom.momhome.mercenaryjoin;

import java.util.List;

import com.mom.momhome.mercenary.MercenaryDto;

public interface MercenaryjoinDao {
	void insertJoin(MercenaryDto dto);
	List<MercenaryjoinDto> getApplicantsList(MercenaryjoinDto dto);
}
