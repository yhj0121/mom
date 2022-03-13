package com.mom.momhome.mercenary;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.mercenaryjoin.MercenaryjoinDao;
import com.mom.momhome.mercenaryjoin.MercenaryjoinDto;

@Service("mercenaryService")
public class MercenaryServiceImpl implements MercenaryService {
	@Resource(name="mercenaryDao")
	MercenaryDao mercenaryDao;
	
	@Resource(name="mercenaryjoinDao")
	MercenaryjoinDao mercenaryjoinDao;

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
	
	@Override
	public int checkDuplicate(MercenaryDto dto) {
		return mercenaryDao.checkDuplicate(dto);
	}

	@Override
	public List<MercenaryDto> getGameList(String user_key) {
		return mercenaryDao.getGameList(user_key);
	}

	
	
	@Override
	public void insertJoin(MercenaryjoinDto dto) {
		mercenaryjoinDao.insertJoin(dto);
		
	}

	@Override
	public List<MercenaryjoinDto> getApplicantsList(MercenaryjoinDto dto) {
		return mercenaryjoinDao.getApplicantsList(dto);
	}

	@Override
	public void updateJoin(MercenaryjoinDto dto) {
		mercenaryjoinDao.updateJoin(dto);
	}

	@Override
	public int getMsCount(String game_key) {
		return mercenaryDao.getMsCount(game_key);
	}

	@Override
	public int mercenaryjoinDuplicate(MercenaryjoinDto dto) {
		return mercenaryjoinDao.mercenaryjoinDuplicate(dto);
	}

	

}
