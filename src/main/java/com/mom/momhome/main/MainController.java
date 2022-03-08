//package com.mom.momhome.main;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.mom.momhome.mercenary.MercenaryDto;
//
//@Controller
//public class MainController {
//	@Resource(name="mainService")
//	MainService mainService;
//	
//	//용병구인글 목록
//	@RequestMapping(value="/home/list", method=RequestMethod.GET)
//	String home_list(Model model, MercenaryDto dto) {
//		List<MercenaryDto> mercenarylist = mainService.getList(dto);
//		model.addAttribute("mercenarylist",mercenarylist);
//		return "/home"; 
//	}
//}
