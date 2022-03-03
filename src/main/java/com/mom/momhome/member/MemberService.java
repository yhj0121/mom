package com.mom.momhome.member;

import java.util.List;

import com.mom.momhome.common.BaseDto;

public interface MemberService {
	boolean isDuplicate( MemberDto dto );
	void insert( MemberDto dto );
	List<BaseDto> getPositionList ( BaseDto dto );
	MemberDto getInfo(MemberDto dto);
	//회원정보수정
	void update( MemberDto dto );
}
