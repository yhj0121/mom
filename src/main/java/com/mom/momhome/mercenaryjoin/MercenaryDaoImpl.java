package com.mom.momhome.mercenaryjoin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.mercenary.MercenaryDto;

@Repository("mercenaryjoinDao")
public class MercenaryDaoImpl implements MercenaryjoinDao{
	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public void insertJoin(MercenaryDto dto) {
		sm.insert("MercenaryJoin_insert",dto);
	}

	@Override
	public List<MercenaryjoinDto> getApplicantsList(MercenaryjoinDto dto) {
		return sm.selectList("Mercenary_getApplicantsList",dto);
	}
	
}
