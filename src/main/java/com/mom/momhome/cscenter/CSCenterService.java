package com.mom.momhome.cscenter;

import java.util.List;

import com.mom.momhome.csanswer.CSAnswerDto;
import com.mom.momhome.member.MemberDto;

public interface CSCenterService {
	List<CSCenterDto> getList(CSCenterDto dto);
	void writeData(CSCenterDto dto);
	CSCenterDto getDetail(CSCenterDto dto);
	int getTotal(CSCenterDto dto);
	MemberDto getInfo(MemberDto dto);
	void updateAnsState(CSAnswerDto dto);
	CSAnswerDto getAnswer(CSAnswerDto dto);
}
