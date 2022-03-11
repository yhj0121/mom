package com.mom.momhome.cscenter;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("cscenterService") // Controller에서 여기에 접근하기 위한 키
public class CSCenterServiceImpl implements CSCenterService {

	@Resource(name="csCenterDao") // CSCenterDao
	CSCenterDao cscenterDao;
	
	@Override
	public List<CSCenterDto> getList(CSCenterDto dto) {
		return cscenterDao.getList(dto);
	}

	@Override
	public void writeData(CSCenterDto dto) {
		cscenterDao.writeData(dto);
	}

	@Override
	public CSCenterDto getDetail(CSCenterDto dto) {
		return cscenterDao.getDetail(dto.getCscenter_key());
	}

	@Override
	public int getTotal(CSCenterDto dto) {
		
		return cscenterDao.getTotal(dto);
	}
	
	
}
