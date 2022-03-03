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
	
	//BaseDto ���� ��������
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
	      
	      //����ó�� -- ������ ���ε��ҋ��� �ݵ�� �������� �ּҰ� �ʿ��ϴ�. d:/project/upload ������ 
	      //������ ��ΰ� ������ ������ ���ε� �� �� ����. 
	      
//	      MultipartFile file = multi.getFile("image");  //Ŭ���̾�Ʈ���� ���� ���Ͽ� ���� ������ Ȯ���Ѵ� 
//	      
//	      //multi.getFile("file�±��� �̸�") ���¸� �ָ� MultipartFile  ������ ��ü�� ��ȯ�Ѵ� 
//	      String path = "C:\\backend\\spring_workspace\\SpringDI_DB2\\upload";
//	      //�� ��ΰ� �����ϴ��� Ȯ���ϱ� 
//	      File dir = new File(path);  //java.io.file
//	      if( !dir.exists() )//��ΰ� ������ ��θ� �����Ѵ� 
//	         dir.mkdirs(); 
//	      
//	      //������ �̹� ������ �ӽø޸𸮿� ���ε� �� ���¿��� ���޵ȴ�. 
//	      //������ ������ ���丮�� �Űܾ߸� �����Ѵ� 
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
		  System.out.println("������ ��ġ�� :" + path);
		  FileUploadUtil.upload(path, multiList, fileNameList);
		  
	      dto.setTeam_emblem(fileNameList.get(0));//�̹��� ���ϸ��� ���� �߰�
	      
	      teamService.insert(dto);
	      
	      return "redirect:/teamList";
	   }
}
