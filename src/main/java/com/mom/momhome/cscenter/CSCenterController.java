package com.mom.momhome.cscenter;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String csCenterDetail(CSCenterDto dto, Model model) {
		model.addAttribute("csDetail", cscenterService.getDetail(dto));
		return "cscenter/csDetailPage";
	}
}
