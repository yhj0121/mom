package com.mom.momhome.member;

import java.util.List;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.cscenter.CSCenterDto;
import com.mom.momhome.game.GameDto;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.mercenary.MercenaryDto;
import com.mom.momhome.team.TeamDto;
import com.mom.momhome.teamjoin.TeamjoinDto;

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
	List<MercenaryDto> getMercenaryList ( MercenaryDto dto );
	int getTotal(MercenaryDto dto); //페이지네이션
	//게임 리스트 가져오기
	List<GameDto> getGameList( GameDto dto );
	int getGameTotal( GameDto dto );
	//팀 리스트 가져오기
	List<TeamDto> getTeamList ( TeamDto dto );
	int getTeamTotal(TeamDto dto); //페이지네이션
	//팀 조인 리스트 가져오기
	List<TeamjoinDto> getTeamjoinList ( TeamjoinDto jdto );
	int getTeamjoinTotal(TeamjoinDto jdto); //페이지네이션
	//팀 조인 승인
	TeamjoinDto teamAccept( TeamjoinDto jdto );
	//팀 조인 거절
	TeamjoinDto teamRefuse( TeamjoinDto jdto );
	//팀 탈퇴 승인
	TeamjoinDto teamoutAccept( TeamjoinDto jdto );
	//팀 탈퇴 거절
	TeamjoinDto teamoutRefuse( TeamjoinDto jdto );
	//회원 퇴출 
	TeamjoinDto teamkickout( TeamjoinDto jdto );
	//내가 가입 신청한 팀 리스트 보기
	List<TeamjoinDto> getMyTeamList( TeamjoinDto jdto );
	//고객센터 리스트 가져오기
	List<CSCenterDto> getCscenterList ( CSCenterDto dto );
	int getCscenterTotal(CSCenterDto dto); //페이지네이션
	//아이디 찾기
	MemberDto findId(MemberDto dto);
	//비밀번호 찾기 
	MemberDto findPassword(MemberDto dto);
	//멤버십 롤 세션 저장
	MembershipDto getMembership(String user_key);
	//회원 탈퇴 진행
	void delete( MemberDto dto );
	//멤버 계정 팀 가입시 멤버십 테이블에 삽입
	void insertMember( MembershipDto dto );
}
