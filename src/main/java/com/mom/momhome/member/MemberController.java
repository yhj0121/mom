package com.mom.momhome.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.cscenter.CSCenterDto;
import com.mom.momhome.game.GameDto;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.mercenary.MercenaryDto;
import com.mom.momhome.team.TeamDto;
import com.mom.momhome.teamjoin.TeamjoinDto;

@Controller
public class MemberController {
	@Resource(name="memberService")
	MemberService memberService;
	
	//회원가입 페이지로 연결 
	@RequestMapping("member/signup")
	String member_register( Model model ) {
		MemberDto dto = new MemberDto();
		model.addAttribute("memberDto", dto); //jsp에서 이거로 받아옴 
		return "member/member_signup";
	}
	
	//회원가입시 아이디 중복체크
	@RequestMapping("/member/isDuplicate")
	@ResponseBody
	public HashMap<String, String> member_isDuplicate(MemberDto dto ) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", memberService.isDuplicate(dto)+"");
		return map;
	}
	
	//회원가입시 포지션 
	@RequestMapping("/member/selectPosition")
	@ResponseBody
	List<BaseDto> member_getPositionList(BaseDto dto, Model model)
	{
		List<BaseDto> list = memberService.getPositionList(dto);
		model.addAttribute("positionList", list);
		return list; 
	}
	
	//회원가입 실행
	@RequestMapping(value="/member/insert", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> member_insert(MemberDto dto) {
		memberService.insert(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}

	//로그인 페이지로 이동 
	@RequestMapping("member/login")
	String member_login() {
		return "member/member_login";
	}
	
	//로그인 실행 
	@RequestMapping(value="/member/login_proc")
	@ResponseBody
	public HashMap<String, String> member_login_proc(MemberDto dto, HttpServletRequest request)
	{
		//각 페이지별로 정보 공유가 안된다. 
		//예외(쿠키 또는 세션- 세션을 사용한다.)
		//쿠키 - 본인컴퓨터에 session- 서버에(보안을 강화시키고자 할때(
		HttpSession session = request.getSession();
		
		MemberDto resultDto = memberService.getInfo(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		if(resultDto==null) {
			map.put("flag", "2");	
		} 
		else 
		{
			if(resultDto.getUser_password().equals(dto.getUser_password())) 
			{
				map.put("flag", "1"); //로그온 성공시 세션에 정보를 저장한다 
				session.setMaxInactiveInterval(1800); //30분 세션 유지 
				session.setAttribute("userid", resultDto.getUser_id());
				session.setAttribute("userkey", resultDto.getUser_key());
				session.setAttribute("password", resultDto.getUser_password());
				session.setAttribute("username", resultDto.getUser_name());
				session.setAttribute("email", resultDto.getUser_mail());
				session.setAttribute("phone", resultDto.getUser_phone());
				
				MembershipDto membershipDto = memberService.getMembership(resultDto.getUser_key());
				if( membershipDto != null )
				{
		        	session.setAttribute("membershipDto", membershipDto);
		        	session.setAttribute("membership_role", membershipDto.getMembership_role());
				}
				else
					session.setAttribute("membershipDto", new MembershipDto());
			} 
	        else 
	        {
				map.put("flag", "3");
			}
		}
		return map;
	}
	
	//로그아웃
	@RequestMapping(value="member/logout")
	public String member_logout(MemberDto dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	//아이디 찾기 페이지로 이동
	@RequestMapping("member/findInfo")
	String member_findinfo() {
		return "member/member_findinfo";
	}
	
	//아이디 찾기 페이지로 이동
	@RequestMapping("member/findid")
	String member_findid() {
		return "member/member_findid";
	}

	//비밀번호 찾기 페이지로 이동
	@RequestMapping("member/findpw")
	String member_findpw() {
		return "member/member_findpw";
	}
	
	//아이디 찾기 실행 
	@RequestMapping(value="member/findid_proc")
	@ResponseBody
	public HashMap<String, String> member_findid_proc( MemberDto dto ){
		MemberDto findDto = memberService.findId(dto);
		HashMap map = new HashMap<String, String>();
		if(findDto == null)
			map.put("result","fail");
		else {
			map.put("result", findDto.getUser_id());
			map.put("userid", findDto.getUser_id());
			map.put("phone", findDto.getUser_phone());
		}
		return map;
	}

	//비밀번호 찾기 실행 
	@RequestMapping(value="/member/findpw_proc")
	@ResponseBody
	public HashMap<String, String> member_findpw_proc(MemberDto dto){	
		MemberDto findDto = memberService.findPassword(dto);
		HashMap map = new HashMap<String, String>();
		if (findDto==null)
			map.put("result", "fail");
		else
		{
			map.put("result", findDto.getUser_password());
			map.put("userid", findDto.getUser_id());
			map.put("username", findDto.getUser_name());
		}
		return map;
	}
	
	//회원 탈퇴
	@RequestMapping("member/delete")
	String member_delete() {
		return "member/member_delete";
	}
	
	//회원탈퇴 진행
	@RequestMapping(value="/member/delete_proc")
	@ResponseBody
	public HashMap<String, String> member_delete_proc( String user_key, MemberDto dto ){	
		dto.setUser_id(user_key);
		memberService.delete(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}

	//마이페이지로 이동
	@RequestMapping("member/mypage")
	String member_mypage() {
		return "member/member_mypage";
	}
	
	//마이페이지-회원정보 수정페이지로 이동 
	@RequestMapping("member/myinfo")
	String member_myinfo( Model model, HttpServletRequest request ) {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		String password = (String)session.getAttribute("password");
		if( userid==null ) {
			return "redirect:/member/member_login";
		}
		MemberDto dto = new MemberDto();
		dto.setUser_id(userid);
		dto.setUser_password(password);
		
		MemberDto resultDto = memberService.getInfo(dto);
		model.addAttribute("memberDto", resultDto);
		return "member/member_myinfo";
	}
	
	//마이페이지-회원정보 수정페이지 수정 기능 
	@RequestMapping(value="/member/update")
	@ResponseBody
	public HashMap<String, String> member_update( MemberDto dto ) {
		memberService.update( dto );
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
	//마이페이지 - 팀 가입/탈퇴내역으로 이동 
	@RequestMapping("member/teamdetail")
	String member_teamdetail( HttpServletRequest request, TeamDto dto, TeamjoinDto jdto, Model model ) {
		HttpSession session = request.getSession();
		String user_key = (String)session.getAttribute("userkey");
		dto.setUser_key(user_key);
		dto.setStart(dto.getPg()*10);
		
		// 나의 팀 내역 가져오기 
		List<TeamDto> list = memberService.getTeamList(dto);
		List<TeamDto> memberTeamList = memberService.getMemberTeamList(dto);
		model.addAttribute("teamList",list);
		model.addAttribute("memberTeamList",memberTeamList);
		model.addAttribute("totalCnt",memberService.getTeamTotal(dto));

		jdto.setUser_key(user_key);
		// 팀 가입/탈퇴 내역 가져오기 
		if( !list.isEmpty()) {
			jdto.setTeam_key(list.get(0).getTeam_key());
		}
		if( !memberTeamList.isEmpty()) {
			jdto.setTeam_key(memberTeamList.get(0).getTeam_key());
		}
		List<TeamjoinDto>teamjoinlist = memberService.getTeamjoinList(jdto);
		List<TeamjoinDto>myteamList =  memberService.getMyTeamList(jdto);
		List<TeamjoinDto>memberMyteamList = memberService.getMemberTeamjoinedList(jdto);
		System.out.println(jdto.toString());
		model.addAttribute("teamjoinlist",teamjoinlist);
		model.addAttribute("myteamList",myteamList);
		model.addAttribute("memberMyteamList",memberMyteamList);
		return "member/member_teamdetail";
	}
	
	//감독 권한- 팀 가입 승인
	@RequestMapping("member/teamAccept")
	@ResponseBody
	public HashMap<String, String> member_teamAccept(String team_key, String user_key, MembershipDto mdto, TeamjoinDto jdto, Model model){
		jdto.setTeam_key(team_key);
		jdto.setUser_key(user_key);
		memberService.teamAccept( jdto );
		
		mdto.setTeam_key(team_key);
		mdto.setUser_key(user_key);
		mdto.setMembership_role("2");
		memberService.insertMember( mdto );
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}

	//감독 권한- 팀 가입 거절
	@RequestMapping("member/teamRefuse")
	@ResponseBody
	public HashMap<String, String> member_teamRefuse(String team_key, String user_key, TeamjoinDto jdto, Model model){
		jdto.setTeam_key(team_key);
		jdto.setUser_key(user_key);
		memberService.teamRefuse( jdto );
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}

	//감독 권한- 팀 탈퇴 승인
	@RequestMapping("member/teamoutAccept")
	@ResponseBody
	public HashMap<String, String> member_teamoutAccept(String team_key, String user_key, MembershipDto mdto, TeamjoinDto jdto, Model model){
		jdto.setTeam_key(team_key);
		jdto.setUser_key(user_key);
		memberService.teamoutAccept( jdto );
		
		mdto.setTeam_key(team_key);
		mdto.setUser_key(user_key);
		memberService.deleteMember( mdto );
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}

	//감독 권한- 팀 탈퇴 거절
	@RequestMapping("member/teamoutRefuse")
	@ResponseBody
	public HashMap<String, String> member_teamoutRefuse(String team_key, String user_key, TeamjoinDto jdto, Model model){
		jdto.setTeam_key(team_key);
		jdto.setUser_key(user_key);
		memberService.teamoutRefuse( jdto );
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}

	//감독 권한- 팀에서 멤버 퇴출 
	@RequestMapping("member/teamkickout")
	@ResponseBody
	public HashMap<String, String> member_teamkickout(String team_key, String user_key, MembershipDto mdto, TeamjoinDto jdto, Model model){
		jdto.setTeam_key(team_key);
		jdto.setUser_key(user_key);
		memberService.teamkickout( jdto );
		
		mdto.setTeam_key(team_key);
		mdto.setUser_key(user_key);
		memberService.deleteMember( mdto );
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
	//마이페이지 - 팀 매칭신청내역으로 이동 
	@RequestMapping("member/matchinglist")
	String member_matchingdetail( HttpServletRequest request, GameDto dto, Model model ) {
		HttpSession session = request.getSession();
		String user_key = (String)session.getAttribute("userkey");
		dto.setUser_key(user_key);
		dto.setStart(dto.getPg()*10);
		List<GameDto> list = memberService.getGameList(dto);
		model.addAttribute("gameList",list);
		model.addAttribute("totalCnt",memberService.getGameTotal(dto));
		return "member/member_matchingdetail";
	}
	
	//마이페이지 - 용병구인내역으로 이동 
	@RequestMapping("member/mercenarylist")
	String member_mercenarydetail( HttpServletRequest request, MercenaryDto dto, Model model ) {
		HttpSession session = request.getSession();
		String user_key = (String)session.getAttribute("userkey");
		dto.setUser_key(user_key);
		dto.setStart(dto.getPg()*10);
		List<MercenaryDto> list = memberService.getMercenaryList(dto);
		model.addAttribute("mercenaryList", list);
		model.addAttribute("totalCnt",memberService.getTotal(dto));
		return "member/member_mercenarydetail";
	}
	
	//마이페이지 - 나의 문의내역으로 이동 
	@RequestMapping("member/cscenterlist")
	String member_cscenterdetail( HttpServletRequest request, CSCenterDto dto, Model model ) {
		HttpSession session = request.getSession();
		String user_key = (String)session.getAttribute("userkey");
		dto.setUser_key(user_key);
		dto.setStart(dto.getPg()*10);
		List<CSCenterDto> list = memberService.getCscenterList(dto);
		model.addAttribute("cscenterList", list);
		model.addAttribute("totalCnt",memberService.getCscenterTotal(dto));
		return "member/member_cscenterlist";
	}
}
