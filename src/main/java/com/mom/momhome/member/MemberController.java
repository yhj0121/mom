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
		
		System.out.println("resultDto: "+resultDto);
		
		if(resultDto==null) {
			map.put("flag", "2");	
		} else {
			if(resultDto.getUser_password().equals(dto.getUser_password())) {
				map.put("flag", "1"); //로그온 성공시 세션에 정보를 저장한다 
				session.setMaxInactiveInterval(1800); //30분 세션 유지 
				session.setAttribute("userid", resultDto.getUser_id());
				session.setAttribute("userkey", resultDto.getUser_key());
				session.setAttribute("password", resultDto.getUser_password());
				session.setAttribute("username", resultDto.getUser_name());
				session.setAttribute("email", resultDto.getUser_mail());
				session.setAttribute("phone", resultDto.getUser_phone());
				System.out.println("로그인 성공: "+resultDto.toString());
			} else {
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
		System.out.println("로그아웃 성공: "+dto.toString());
		System.out.println("로그아웃 성공: "+session.getId());
		return "redirect:/";
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
		System.out.println("세션상태: "+session.toString());
		System.out.println("userid: "+userid);
		System.out.println("password: "+password);
		if( userid==null ) {
			return "redirect:/member/member_login";
		}
		MemberDto dto = new MemberDto();
		dto.setUser_id(userid);
		dto.setUser_password(password);
		
		MemberDto resultDto = memberService.getInfo(dto);
		model.addAttribute("memberDto", resultDto);
		System.out.println("resultDto는 "+resultDto);
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
	
	//마이페이지-팀 가입/탈퇴내역으로 이동 
	@RequestMapping("member/teamdetail")
	String member_teamdetail() {
		return "member/member_teamdetail";
	}
	
	//마이페이지-팀 매칭신청내역으로 이동 
	@RequestMapping("member/matchinglist")
	String member_matchingdetail() {
		return "member/member_matchingdetail";
	}
	
	//마이페이지-팀 용병구인내역으로 이동 
	@RequestMapping("member/mercenarylist")
	String member_mercenarydetail() {
		return "member/member_mercenarydetail";
	}
}
