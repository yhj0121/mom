package com.mom.momhome.csanswer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("csAnsDao")
public class CSAnswerDaoImpl implements CSAnswerDao {
	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public void insert(CSAnswerDto dto) {
		sm.insert("csansInsert", dto);
	}

	@Override
	public CSAnswerDto select(CSAnswerDto dto) {
		return sm.selectOne("csansSelect", dto);
	}
}
