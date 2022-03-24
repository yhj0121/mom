package com.mom.momhome.teamjoin;

import java.util.List;


public interface TeamjoinDao {
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
	//멤버권한 가입내역 가져오기
	List<TeamjoinDto> getMemberTeamjoinedList( TeamjoinDto jdto );
		
	int getCountForCheckingDuplicate(TeamjoinDto jdto);
}
