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
	public String csCenterMain(Model model) {
		model.addAttribute("csCenterList", cscenterService.getList());
		return "cscenter/csCenterPage";
	}
	
	@RequestMapping(value = "/cscenter/write", method = RequestMethod.GET)
	public String csCenterWrite() {
		
		
		return "cscenter/csWritePage";
	}
	
	@RequestMapping(value = "/cscenter/write/save", method = RequestMethod.POST)
	public String csCenterWriteSave(CSCenterDto dto) {
		
		cscenterService.writeData(dto);
		return "redirect:/cscenter/csCenterPage";
	}
	
	@RequestMapping(value = "/cscenter/detail", method = RequestMethod.GET)
	public String csCenterDetail() {
		return "cscenter/csDetailPage";
	}
	
	
}
