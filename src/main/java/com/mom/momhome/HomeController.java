package com.mom.momhome;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mom.momhome.cscenter.CSCenterDto;
import com.mom.momhome.game.GameDto;
import com.mom.momhome.main.MainService;
import com.mom.momhome.mercenary.MercenaryDto;
import com.mom.momhome.team.TeamDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Resource(name="mainService")
	MainService mainService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,  MercenaryDto mdto, GameDto gdto, TeamDto tdto, CSCenterDto cdto ) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		//메인 페이지에 용병리스트 5개 뿌리기 
		List<MercenaryDto> mercenarylist = mainService.getMercenaryList(mdto);
		model.addAttribute("mercenarylist",mercenarylist);
		
		//메인 페이지에 게임리스트 5개 뿌리기 
		List<GameDto> gamelist = mainService.getGameList(gdto);
		model.addAttribute("gamelist",gamelist);
		
		//메인 페이지에 팀 리스트 5개 뿌리기
		List<TeamDto> teamlist = mainService.getTeamList(tdto);
		model.addAttribute("teamlist",teamlist);
		
		//메인 페이지에 고객센터 리스트 5개 뿌리기
		List<CSCenterDto> cscenterlist = mainService.getCScenterList(cdto);
		model.addAttribute("cscenterlist",cscenterlist);
		
		return "home";
	}
	
	@RequestMapping(value = "/single", method = RequestMethod.GET)
	public String home() {
		return "single";
	}
	
	@RequestMapping(value = "/demo", method = RequestMethod.GET)
	public String demo() {
		return "demo";
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error() {
		return "error";
	}
	
}
