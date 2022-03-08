package com.mom.momhome.cscenter;

import java.util.List;

public interface CSCenterService {
	List<CSCenterDto> getList();
	void writeData(CSCenterDto dto);
}
