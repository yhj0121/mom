package com.mom.momhome.team;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.common.FileUploadUtil;
import com.mom.momhome.member.MemberDto;
import com.mom.momhome.member.MemberService;
import com.mom.momhome.membership.MembershipDto;
import com.mom.momhome.teamjoin.TeamjoinDto;


@Controller
public class TeamController {

	@Resource(name="teamService")
	TeamService teamService;
	
	@Resource(name="memberService")
	MemberService memberService;
	
	//팀 메인 페이지 연결
	@RequestMapping(value = "/team/main", method = RequestMethod.GET)
	public String teamMain() {
		return "team/team_main";
	}
	
	//팀 조회 
	@RequestMapping(value = "/team/list", method = RequestMethod.GET)
	String team_List(Model model, TeamDto dto, MemberDto mdto)
	{
		System.out.println("선택: " + dto.getKey());
		System.out.println("선택: " + dto.getKeyword());
			
		dto.setStart(dto.getPg()*10);
			
		List<TeamDto> list = teamService.getTeamList(dto);

		for(TeamDto teamdto: list)
			System.out.println(teamdto.getTeam_name());
		
		model.addAttribute("getTeamList",list);
		
		model.addAttribute("totalCnt",teamService.getTeamTotal(dto));
		return "team/team_list"; 
	}
	//팀 상세보기
	@RequestMapping("/team/view")
	String team_view(TeamDto dto, Model model, HttpServletRequest request)
	{
		List<TeamDto> list = teamService.getTeamViewList(dto);
		TeamDto resultDto = teamService.getTeamView(dto);
		
		model.addAttribute("getTeamViewList", list);
		model.addAttribute("teamDto", resultDto);
		
		HttpSession session = request.getSession();
		MembershipDto membershipDto = memberService.getMembership(dto.getUser_key());
		if( membershipDto != null )
		{
        	session.setAttribute("membershipDto", membershipDto);
        	session.setAttribute("membership_role", membershipDto.getMembership_role());
		}
		else
			session.setAttribute("membershipDto", new MembershipDto());
		
		return "team/team_view";
	}
	
//	@RequestMapping("/team/viewlist")
//	String team_viewList(TeamDto dto, Model model)
//	{
//		List<TeamDto> list = teamService.getTeamViewList(dto);
//		
//		for(TeamDto teamdto : list)
//		model.addAttribute("getTeamViewList", list);
//		
//		return "team/team_view";
//	}
	
	//팀 생성 화면 연결
	@RequestMapping("/team/write")
	String team_write(Model model) {
		TeamDto dto = new TeamDto();
		model.addAttribute("teamDto", dto);
		return "team/team_write";
	}

	
	

	//지역 정보 리스트 (팀생성 화면에서 지역 선택 보여주기)
	@RequestMapping("/team/selectCity")
	@ResponseBody
	List<BaseDto> team_getCityList(BaseDto dto, Model model)
	{
		List<BaseDto> list = teamService.getCityList(dto);
		model.addAttribute("cityList", list);
		return list;
	}
	
	//팀 생성 에서 팀이름 중복검사
	@RequestMapping("/team/isDuplicate")
	@ResponseBody
	public HashMap<String, String> team_isDuplicate(TeamDto dto ) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", teamService.isDuplicate(dto)+"");
		return map;
	}
	
	//팀 insert 및 앰블럼(사진)저장하기 *수정함*
	@RequestMapping("/team/save")
	   String team_save( TeamDto dto, MembershipDto mdto, HttpServletRequest req, MultipartHttpServletRequest multi )
	   {
		  List<MultipartFile> multiList = new ArrayList<MultipartFile>();
		  multiList.add(multi.getFile("upload"));
		  
		  List<String> fileNameList = new ArrayList<String>();
		  String path = req.getServletContext().getRealPath("/");
		  System.out.println("물리적 위치값:" + path);
		  FileUploadUtil.upload(path, multiList, fileNameList);
		  
	      dto.setTeam_emblem(fileNameList.get(0)); 
	      
	      teamService.insert(dto, mdto, req);
	      
	      return "redirect:/team/main"; //팀 생성 후 이동하기 list이동 수정함
	   }

	@RequestMapping("/team/teamJoin")
	String team_join(TeamjoinDto dto)
	{
		teamService.Teamjoin_teamjoinInsert(dto);
		return "redirect:/team/list";
	}
	
	@RequestMapping("/team/checkJoinDuplicate")
	@ResponseBody
	int gamejoin_duplicate(TeamjoinDto jdto)
	{	
		int count = teamService.getCountForCheckingDuplicate(jdto);
		return count;
	}
}


