package com.mom.momhome.member;

import java.util.List;

import com.mom.momhome.common.BaseDto;

public interface MemberDao {
	//아이디 중복확인 
	boolean isDuplicate( MemberDto dto );
	//회원가입 진행 
	void insert( MemberDto dto );
	//포지션 리스트 전달
	List<BaseDto> getPositionList ( BaseDto dto );
	//로그인 진행 
	MemberDto getInfo(MemberDto dto);
	//회원정보수정
	void update( MemberDto dto );
}
