package com.mom.momhome.cscenter;

import java.util.List;

public interface CSCenterDao {
	List<CSCenterDto> getList(CSCenterDto dto);
	void writeData(CSCenterDto dto);
	CSCenterDto getDetail(String cscenter_key);
	int getTotal(CSCenterDto dto);
	void updateAnsState(Integer listId);
}
