package com.mom.momhome.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.cscenter.CSCenterDto;
import com.mom.momhome.game.GameDto;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.mercenary.MercenaryDto;
import com.mom.momhome.team.TeamDto;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public boolean isDuplicate(MemberDto dto) {
		int cnt = sm.selectOne("Member_isDuplicate", dto);
		if( cnt == 0 )
			return false;
		else
			return true;
	}

	@Override
	public void insert(MemberDto dto) {
		sm.insert("Member_insert", dto);
	}

	@Override
	public List<BaseDto> getPositionList( BaseDto dto ) {
		return sm.selectList("getPositionList", dto );
	}

	@Override
	public MemberDto getInfo(MemberDto dto) {
		return sm.selectOne("Member_getInfo", dto);
	}
	
	@Override
	public MemberDto getSimpleInfo(String user_key){
		return sm.selectOne("Member_getSimpleInfo", user_key);
	}

	@Override
	public void update(MemberDto dto) {
		sm.update("Member_update", dto);
	}

	@Override
	public List<MercenaryDto> getMercenaryList(MercenaryDto dto) {
		return sm.selectList( "Member_mercenaryList", dto );
	}

	@Override
	public int getTotal(MercenaryDto dto) {
		return sm.selectOne("Member_mercenaryGetTotal",dto);
	}

	@Override
	public MemberDto findId(MemberDto dto) {
		return sm.selectOne("Member_findid", dto);
	}

	@Override
	public MemberDto findPassword(MemberDto dto) {
		return sm.selectOne("Member_findpassword", dto);
	}

	@Override
	public void delete(MemberDto dto) {
		sm.delete("Member_delete", dto);
	}

	@Override
	public List<GameDto> getGameList(GameDto dto) {
		return sm.selectList( "Member_gameList", dto );
	}

	@Override
	public int getGameTotal(GameDto dto) {
		return sm.selectOne("Member_gameGetTotal",dto);
	}

	@Override
	public List<TeamDto> getTeamList(TeamDto dto) {
		return sm.selectList("Member_DirectorteamList", dto);
	}

	@Override
	public int getTeamTotal(TeamDto dto) {
		return sm.selectOne("Member_teamGetTotal", dto);
	}

	@Override
	public List<CSCenterDto> getCscenterList(CSCenterDto dto) {
		return sm.selectList("Member_cscenterList", dto);
	}

	@Override
	public int getCscenterTotal(CSCenterDto dto) {
		return sm.selectOne("Member_cscenterGetTotal", dto);
	}

	@Override
	public List<TeamDto> getMemberTeamList(TeamDto dto) {
		return sm.selectList("Member_MemberteamList", dto);
	}

}
