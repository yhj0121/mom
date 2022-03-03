package com.mom.momhome.team;

import java.util.ArrayList;
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

@Controller
public class TeamController {

	@Resource(name="teamService")
	TeamService teamService;
	
	@RequestMapping(value = "/team/main", method = RequestMethod.GET)
	public String teamList() {
		return "team/teamMain";
	}
	
	@RequestMapping("/team/list")
	   String gallery_list(Model model, TeamDto dto)
	   {
		   dto.setPageSize(12);
		   dto.setStart(dto.getPg()*dto.getPageSize());
		   
		   List<TeamDto> list = teamService.getList(dto);
		   int cnt = teamService.getTotal(dto);
		   
		   model.addAttribute("galleryList", list);
		   model.addAttribute("totalCnt", cnt);
		   
	      return "gallery/gallery_list";
	   }
	
	
	
//	@RequestMapping(value = "/teamWrite", method = RequestMethod.GET)
//	public String teamWrite() {
//		return "team/teamWrite";
//	}
	
	@RequestMapping("/team/write")
	String teamWrite(Model model) {
		TeamDto dto = new TeamDto();
		model.addAttribute("teamDto", dto);
		return "team/teamWrite";
	}
	
	 @RequestMapping("/team/save")
	   String team_save( TeamDto dto, HttpServletRequest req, MultipartHttpServletRequest multi )
	   {
	      

		   
		  List<MultipartFile> multiList = new ArrayList<MultipartFile>();
		  multiList.add(multi.getFile("upload"));
		  
		  List<String> fileNameList = new ArrayList<String>();
		  String path = req.getServletContext().getRealPath("/");
		  System.out.println("������ ��ġ�� :" + path);
		  FileUploadUtil.upload(path, multiList, fileNameList);
		  
	      dto.setTeam_emblem(fileNameList.get(0));
	      
	      teamService.insert(dto);
	      
	      return "redirect:/team/main";
	   }
}
