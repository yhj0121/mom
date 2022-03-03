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
	public String home() {
		return "cscenter/CSCenterPage";
	}
}
