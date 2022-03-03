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
	
	@RequestMapping(value = "/teamMain", method = RequestMethod.GET)
	public String teamList() {
		return "team/teamMain";
	}
	
	@RequestMapping("/teamList")
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
	
	//BaseDto 지역 가져오기
	@RequestMapping("/selectCity")
	@ResponseBody
	List<BaseDto> team_getCityList(BaseDto dto, Model model)
	{
		List<BaseDto> list = teamService.getCityList(dto);
		model.addAttribute("cityList", list);
		return list;
	}
	
	
//	@RequestMapping(value = "/teamWrite", method = RequestMethod.GET)
//	public String teamWrite() {
//		return "team/teamWrite";
//	}
	
	@RequestMapping("/teamWrite")
	String teamWrite(Model model) {
		TeamDto dto = new TeamDto();
		model.addAttribute("teamDto", dto);
		return "team/teamWrite";
	}
	
	 @RequestMapping("/team/save")
	   String team_save( TeamDto dto, HttpServletRequest req, MultipartHttpServletRequest multi )
	   {
	      
	      //파일처리 -- 파일을 업로드할떄는 반드시 물리적인 주소가 필요하다. d:/project/upload 식으로 
	      //물리적 경로가 없으면 파일을 업로드 할 수 없다. 
	      
//	      MultipartFile file = multi.getFile("image");  //클라이언트에서 보낸 파일에 대한 정보를 확인한다 
//	      
//	      //multi.getFile("file태그의 이름") 형태를 주면 MultipartFile  형태의 객체를 반환한다 
//	      String path = "C:\\backend\\spring_workspace\\SpringDI_DB2\\upload";
//	      //이 경로가 존재하는지 확인하기 
//	      File dir = new File(path);  //java.io.file
//	      if( !dir.exists() )//경로가 없으면 경로를 생성한다 
//	         dir.mkdirs(); 
//	      
//	      //파일은 이미 서버의 임시메모리에 업로드 된 상태에서 전달된다. 
//	      //파일을 지정된 디렉토리로 옮겨야만 존재한다 
//	      try {
//	         file.transferTo( new File(path +"/a.jpg"));
//	         
//	      } catch (IllegalStateException e) {
//	         
//	         e.printStackTrace();
//	      } catch (IOException e) {
//	         
//	         e.printStackTrace();
//	      }
		   
		  List<MultipartFile> multiList = new ArrayList<MultipartFile>();
		  multiList.add(multi.getFile("upload"));
		  
		  List<String> fileNameList = new ArrayList<String>();
		  String path = req.getServletContext().getRealPath("/");
		  System.out.println("물리적 위치값 :" + path);
		  FileUploadUtil.upload(path, multiList, fileNameList);
		  
	      dto.setTeam_emblem(fileNameList.get(0));//이미지 파일명은 따로 추가
	      
	      teamService.insert(dto);
	      
	      return "redirect:/teamList";
	   }
}
