package com.mom.momhome.cscenter;

import java.util.List;

public interface CSCenterService {
	List<CSCenterDto> getList(CSCenterDto dto);
	void writeData(CSCenterDto dto);
	CSCenterDto getDetail(CSCenterDto dto);
	int getTotal(CSCenterDto dto);
}
