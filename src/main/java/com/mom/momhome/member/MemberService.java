package com.mom.momhome.member;

import java.util.List;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.mercenary.MercenaryDto;

public interface MemberService {
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
	//용병 리스트 가져오기
	List<MercenaryDto> getMercenaryList ( String userkey );
	int getTotal(String userkey); //페이지네이션
	//아이디 찾기
	MemberDto findId(MemberDto dto);
	//비밀번호 찾기 
	MemberDto findPassword(MemberDto dto);
}
