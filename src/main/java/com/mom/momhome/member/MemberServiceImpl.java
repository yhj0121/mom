package com.mom.momhome.member;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.common.BaseDto;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Resource(name="memberDao")
	MemberDao memberDao;
	
	@Override
	public boolean isDuplicate(MemberDto dto) {
		return memberDao.isDuplicate(dto);
	}

	@Override
	public void insert(MemberDto dto) {
		memberDao.insert( dto );
	}

	@Override
	public List<BaseDto> getPositionList(BaseDto dto) {
		return memberDao.getPositionList( dto );
	}

	@Override
	public MemberDto getInfo(MemberDto dto) {
		return memberDao.getInfo(dto);
	}

	@Override
	public void update(MemberDto dto) {
		memberDao.update(dto);
	}
}
