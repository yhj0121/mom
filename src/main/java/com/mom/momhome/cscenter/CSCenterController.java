package com.mom.momhome.cscenter;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.momhome.csanswer.CSAnswerDto;
import com.mom.momhome.member.MemberDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CSCenterController {
	@Resource(name="cscenterService")
	CSCenterService cscenterService;
	
	
	@RequestMapping(value = "/cscenter", method = RequestMethod.GET)
	public String csCenterMain(CSCenterDto dto, Model model) {
		dto.setStart(dto.getPg()*10);
		model.addAttribute("csCenterList", cscenterService.getList(dto));
		model.addAttribute("totalCnt",cscenterService.getTotal(dto));
		return "cscenter/csCenterPage";
	}
	
	@RequestMapping(value = "/cscenter/write", method = RequestMethod.GET)
	public String csCenterWrite() {
		
		
		return "cscenter/csWritePage";
	}
	
	@RequestMapping(value = "/cscenter/write/save", method = RequestMethod.POST)
	public String csCenterWriteSave(CSCenterDto dto) {
		
		cscenterService.writeData(dto);
		return "redirect:/cscenter";
	}
	
	@RequestMapping(value = "/cscenter/detail", method = RequestMethod.GET)
	public String csCenterDetail(CSCenterDto dto, Model model, HttpServletRequest request) {
		model.addAttribute("csDetail", cscenterService.getDetail(dto));
		MemberDto mdto = new MemberDto();
		HttpSession session = request.getSession();
		mdto.setUser_id((String)session.getAttribute("userid"));
		mdto.setUser_password((String)session.getAttribute("password"));
		
		MemberDto resultMdto = cscenterService.getInfo(mdto);
		if(resultMdto == null) {
			resultMdto = new MemberDto();
		}
		
		model.addAttribute("memberDto", resultMdto);
		CSAnswerDto cdto = new CSAnswerDto();
		cdto.setListId(Integer.parseInt(dto.getCscenter_key()));
		model.addAttribute("answerDto", cscenterService.getAnswer(cdto));
		
		return "cscenter/csDetailPage";
	}
	
	@RequestMapping(value = "/cscenter/detail/insert", method = RequestMethod.POST)
	@ResponseBody
	public String csAnserDetail(@RequestBody HashMap<String, Object> map, Model model, HttpServletRequest request) {
		CSAnswerDto cdto = new CSAnswerDto();
		cdto.setListId((Integer)map.get("listId"));
		cdto.setANS_CONTENT((String)map.get("ANS_CONTENT"));
		System.out.println("controller list" + cdto.getListId());
		System.out.println("controller content" + cdto.getANS_CONTENT());
		cscenterService.updateAnsState(cdto);
		CSCenterDto csdto = new CSCenterDto();
		csdto.setCscenter_key(String.valueOf((Integer)map.get("listId")));
		model.addAttribute("csDetail", cscenterService.getDetail(csdto));
		
		MemberDto mdto = new MemberDto();
		HttpSession session = request.getSession();
		mdto.setUser_id((String)session.getAttribute("userid"));
		mdto.setUser_password((String)session.getAttribute("password"));
		
		MemberDto resultMdto = cscenterService.getInfo(mdto);
		if(resultMdto == null) {
			resultMdto = new MemberDto();
		}
		
		model.addAttribute("memberDto", resultMdto);
		model.addAttribute("answerDto", cscenterService.getAnswer(cdto));		
		
		return "cscenter/csDetailPage";
	}
}
