package com.mom.momhome.mercenary;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mercenaryDao")
public class MercenaryDaoImpl implements MercenaryDao {
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<MercenaryDto> getList(MercenaryDto dto) {
		return sm.selectList("Mercenary_getList",dto);
	}

	@Override
	public void insert(MercenaryDto dto) {
		sm.insert("Mercenary_insert",dto);
	}

	@Override
	public void delete(String mercenary_key) {
		sm.delete("Mercenary_delete", mercenary_key);
	}

	@Override
	public void update(MercenaryDto dto) {
		sm.update("Mercenary_update", dto);
	}

	@Override
	public MercenaryDto getView(String mercenary_key) {
		return sm.selectOne("Mercenary_getView",mercenary_key);
	}

	@Override
	public int getTotal(MercenaryDto dto) {
		return sm.selectOne("Mercenary_getTotal",dto);
	}

}
