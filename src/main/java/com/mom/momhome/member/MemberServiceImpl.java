package com.mom.momhome.member;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.cscenter.CSCenterDto;
import com.mom.momhome.game.GameDto;
import com.mom.momhome.membership.MembershipDao;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.mercenary.MercenaryDto;
import com.mom.momhome.team.TeamDto;
import com.mom.momhome.teamjoin.TeamjoinDao;
import com.mom.momhome.teamjoin.TeamjoinDto;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Resource(name="memberDao")
	MemberDao memberDao;
	
	@Resource(name="teamjoinDao")
	TeamjoinDao teamjoinDao;
	
	@Resource(name="membershipDao")
	MembershipDao membershipDao;
	
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

	@Override
	public List<MercenaryDto> getMercenaryList( MercenaryDto dto) {
		return memberDao.getMercenaryList(dto);
	}

	@Override
	public int getTotal(MercenaryDto dto) {
		return memberDao.getTotal(dto);
	}

	@Override
	public MemberDto findId(MemberDto dto) {
		return memberDao.findId(dto);
	}

	@Override
	public MemberDto findPassword(MemberDto dto) {
		return memberDao.findPassword(dto);
	}
	
	@Override
	public MembershipDto getMembership(String user_key){
		return membershipDao.getMembership(user_key);
	}

	@Override
	public void delete(MemberDto dto) {
		memberDao.delete( dto );
	}

	@Override
	public List<GameDto> getGameList(GameDto dto) {
		return memberDao.getGameList(dto);
	}

	@Override
	public int getGameTotal(GameDto dto) {
		return memberDao.getGameTotal(dto);
	}

	@Override
	public List<TeamDto> getTeamList(TeamDto dto) {
		return memberDao.getTeamList(dto);
	}

	@Override
	public int getTeamTotal(TeamDto dto) {
		return memberDao.getTeamTotal(dto);
	}

	@Override
	public List<CSCenterDto> getCscenterList(CSCenterDto dto) {
		return memberDao.getCscenterList(dto);
	}

	@Override
	public int getCscenterTotal(CSCenterDto dto) {
		return memberDao.getCscenterTotal(dto);
	}

	@Override
	public List<TeamjoinDto> getTeamjoinList(TeamjoinDto jdto) {
		return teamjoinDao.getTeamjoinList(jdto);
	}

	@Override
	public int getTeamjoinTotal(TeamjoinDto dto) {
		return teamjoinDao.getTeamjoinTotal(dto);
	}

	@Override
	public TeamjoinDto teamAccept( TeamjoinDto jdto ) {
		return teamjoinDao.teamAccept(jdto);
	}

	@Override
	public TeamjoinDto teamRefuse(TeamjoinDto jdto) {
		return teamjoinDao.teamRefuse(jdto);
	}

	@Override
	public TeamjoinDto teamoutAccept(TeamjoinDto jdto) {
		return teamjoinDao.teamoutAccept(jdto);
	}

	@Override
	public TeamjoinDto teamoutRefuse(TeamjoinDto jdto) {
		return teamjoinDao.teamoutRefuse(jdto);
	}

	@Override
	public List<TeamjoinDto> getMyTeamList(TeamjoinDto jdto) {
		return teamjoinDao.getMyTeamList(jdto);
	}

	@Override
	public TeamjoinDto teamkickout(TeamjoinDto jdto) {
		return teamjoinDao.teamkickout(jdto);
	}

	@Override
	public void insertMember(MembershipDto dto) {
		membershipDao.insertMember(dto);
	}

}
