package com.mom.momhome.cscenter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CSCenterController {
	@RequestMapping(value = "/cscenter", method = RequestMethod.GET)
	public String csCenterMain() {
		return "cscenter/csCenterPage";
	}
	
	@RequestMapping(value = "/cscenter/write", method = RequestMethod.GET)
	public String csCenterWrite() {
		return "cscenter/csWritePage";
	}
	
	@RequestMapping(value = "/cscenter/detail", method = RequestMethod.GET)
	public String csCenterDetail() {
		return "cscenter/csDetailPage";
	}
	
	
}
