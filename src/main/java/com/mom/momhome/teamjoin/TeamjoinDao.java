package com.mom.momhome.teamjoin;

import java.util.List;

public interface TeamjoinDao {
	//팀 조인 리스트 가져오기
	List<TeamjoinDto> getTeamjoinList ( TeamjoinDto jdto );
	int getTeamjoinTotal(TeamjoinDto jdto); //페이지네이션
	//팀 조인 승인
	TeamjoinDto teamAccept( TeamjoinDto jdto );
}
