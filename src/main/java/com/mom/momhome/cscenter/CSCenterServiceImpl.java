package com.mom.momhome.cscenter;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.csanswer.CSAnswerDao;
import com.mom.momhome.csanswer.CSAnswerDto;
import com.mom.momhome.member.MemberDao;
import com.mom.momhome.member.MemberDto;

@Service("cscenterService") // Controller에서 여기에 접근하기 위한 키
public class CSCenterServiceImpl implements CSCenterService {
	@Resource(name="csAnsDao")
	CSAnswerDao csanswerdao;
	
	@Resource(name="csCenterDao") // CSCenterDao
	CSCenterDao cscenterDao;
	
	@Resource(name="memberDao") // CSCenterDao
	MemberDao memberDao;
	
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

	@Override
	public MemberDto getInfo(MemberDto dto) {
		
		return memberDao.getInfo(dto);
	}

	@Override
	public void updateAnsState(CSAnswerDto dto) {
		csanswerdao.insert(dto);
		cscenterDao.updateAnsState(dto.getListId());
	}
	
	@Override
	public CSAnswerDto getAnswer(CSAnswerDto dto) {
		return csanswerdao.select(dto);
	}
	
}
