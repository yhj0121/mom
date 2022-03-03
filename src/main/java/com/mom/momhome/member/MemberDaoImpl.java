package com.mom.momhome.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.common.BaseDto;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public boolean isDuplicate(MemberDto dto) {
		int cnt = sm.selectOne("Member_isDuplicate", dto);
		if( cnt == 0 )
			return false;
		else
			return true;
	}

	@Override
	public void insert(MemberDto dto) {
		sm.insert("Member_insert", dto);
	}

	@Override
	public List<BaseDto> getPositionList( BaseDto dto ) {
		return sm.selectList("getPositionList", dto );
	}

	@Override
	public MemberDto getInfo(MemberDto dto) {
		return sm.selectOne("Member_getInfo", dto);
	}

	@Override
	public void update(MemberDto dto) {
		sm.update("Member_update", dto);
	}
}
