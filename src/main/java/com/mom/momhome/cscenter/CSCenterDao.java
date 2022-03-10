package com.mom.momhome.cscenter;

import java.util.List;

public interface CSCenterDao {
	List<CSCenterDto> getList();
	void writeData(CSCenterDto dto);
}
