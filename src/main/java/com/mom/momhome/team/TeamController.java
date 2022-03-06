package com.mom.momhome.team;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

@Controller
public class TeamController {

	@Resource(name="teamService")
	TeamService teamService;
	
	//팀 메인 페이지 연결
	@RequestMapping(value = "/team/main", method = RequestMethod.GET)
	public String teamMain() {
		return "team/team_main";
	}
	
	@RequestMapping(value = "/team/list", method = RequestMethod.GET)
	public String teamList() {
		return "team/team_list";
	}
	
	
	//팀 생성 화면 연결
	@RequestMapping("/team/write")
	String team_write(Model model) {
		TeamDto dto = new TeamDto();
		model.addAttribute("teamDto", dto);
		return "team/team_write";
	}
	

	//지역 정보 리스트 (팀생성 화면에서 보여주기)
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
	
	//팀 생성시 앰블럼(사진) 저장하기
	 @RequestMapping("/team/save")
	   String team_save( TeamDto dto, HttpServletRequest req, MultipartHttpServletRequest multi )
	   {

		  List<MultipartFile> multiList = new ArrayList<MultipartFile>();
		  multiList.add(multi.getFile("upload"));
		  
		  List<String> fileNameList = new ArrayList<String>();
		  String path = req.getServletContext().getRealPath("/");
		  System.out.println("������ ��ġ�� :" + path);
		  FileUploadUtil.upload(path, multiList, fileNameList);
		  
	      dto.setTeam_emblem(fileNameList.get(0)); //Team_emblem 에 파일 저장
	      
	      teamService.insert(dto);
	      
	      return "redirect:/team/main";
	   }
	 
	 // 팀 생성 하기
	 @RequestMapping(value="/team/insert", method=RequestMethod.POST)
	 @ResponseBody
		public HashMap<String, String> team_insert(TeamDto dto) {
			teamService.insert(dto);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("result", "success");
			return map;
		}
}
