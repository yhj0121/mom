package com.mom.momhome.gamejoin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.momhome.game.GameDto;

@Controller
public class GameJoinController {
	@Resource(name="gamejoinService")
	GameJoinService gamejoinService;
	
	@RequestMapping(value="/game/matchList", method=RequestMethod.GET)
	String game_matchList( GameJoinDto dto, Model model )
	{
		dto.setStart(dto.getPg()*10);
		List<GameJoinDto> matchList = gamejoinService.getMatchTeamList(dto);
		model.addAttribute("matchList", matchList);
		model.addAttribute("totalCnt",gamejoinService.getMatchTotal(dto));
		return "game/game_matchList"; 
	}
}
