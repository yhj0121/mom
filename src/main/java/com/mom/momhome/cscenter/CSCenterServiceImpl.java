package com.mom.momhome.cscenter;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("cscenterService") // Controller에서 여기에 접근하기 위한 키
public class CSCenterServiceImpl implements CSCenterService {
<<<<<<< Updated upstream
	@Resource(name="csCenterDao") // CSCenterDao
=======
	@Resource(name="cscenterDao") // CSCenterDao
>>>>>>> Stashed changes
	CSCenterDao cscenterDao;
	
	@Override
	public List<CSCenterDto> getList() {
		return cscenterDao.getList();
	}

	@Override
	public void writeData(CSCenterDto dto) {
		cscenterDao.writeData(dto);
	}
	
	
}
