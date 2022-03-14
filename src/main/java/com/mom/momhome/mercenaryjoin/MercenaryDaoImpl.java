package com.mom.momhome.mercenaryjoin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mercenaryjoinDao")
public class MercenaryDaoImpl implements MercenaryjoinDao{
	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public void insertJoin(MercenaryjoinDto dto) {
		sm.insert("MercenaryJoin_insert",dto);
	}

	@Override
	public List<MercenaryjoinDto> getApplicantsList(MercenaryjoinDto dto) {
		return sm.selectList("Mercenary_getApplicantsList",dto);
	}

	@Override
	public void updateJoin(MercenaryjoinDto dto) {
		sm.update("Mercenaryjoin_update", dto);
	}

	@Override
	public int mercenaryjoinDuplicate(MercenaryjoinDto dto) {
		return sm.selectOne("Mercenaryjoin_duplicate", dto);
	}

	@Override
	public int getApproveCount(String mercenary_key) {
		return sm.selectOne("Mercenary_getApproveCount", mercenary_key);
	}

	
}
