package com.mom.momhome.mercenary;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mercenaryService")
public class MercenaryServiceImpl implements MercenaryService {
	@Resource(name="mercenaryDao")
	MercenaryDao mercenaryDao;

	@Override
	public List<MercenaryDto> getList(MercenaryDto dto) {
		return mercenaryDao.getList(dto);
	}

	@Override
	public void insert(MercenaryDto dto) {
		mercenaryDao.insert(dto);
	}

	@Override
	public void delete(String mercenary_key) {
		mercenaryDao.delete(mercenary_key);
	}

	@Override
	public void update(MercenaryDto dto) {
		mercenaryDao.update(dto);
	}

	@Override
	public MercenaryDto getView(String mercenary_key) {
		return mercenaryDao.getView(mercenary_key);
	}

	@Override
	public int getTotal(MercenaryDto dto) {
		return mercenaryDao.getTotal(dto);
	}
}