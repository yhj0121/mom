package com.mom.momhome.game;

import java.util.HashMap;
import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class GameController {

	@Resource(name="gameService")
	GameService service;
	
	
	@RequestMapping(value="/game" ,method=RequestMethod.GET)
	String main()
	{
		return "game/gamemain";
	}
	
//	@RequestMapping("/game/joinornot")
//	@ResponseBody
//	public HashMap<String,Character> matching_check(MatchingJoinDto dto)
//	{
//		HashMap<String, Character> map = new HashMap<String,Character>();
//		
//		map.put("result", service.joinornot(dto));
//		return map;
//	}
	
	@RequestMapping(value="game/view", method=RequestMethod.GET)
	String view(Model model,String id)
	{
		GameDto dto = service.getView(id);
		model.addAttribute("GameDto", dto);

		return "game/gameview";
	}
	
	
	@RequestMapping(value="game/list", method=RequestMethod.GET)
	String game_list(Model model, GameDto dto)
	{
		
		
		dto.setStart( dto.getPg()*10); 
		
		List<GameDto> list = service.getList(dto);
		
		
	
		model.addAttribute("boardList", list);
		model.addAttribute("totalCnt", service.getTotal(dto));
		
		return "game/gamelist"; 
	}
	

	
	@RequestMapping(value="/game/write")
	String game_write(Model model)
	{
		model.addAttribute("GameDto", new GameDto()); 
		return "game/gamewrite";
	}
	
	@RequestMapping(value="/game/save")
	String board_save(GameDto dto)
	{
//			service.insert(join);

			service.insert(dto);
	
		
		return "redirect:/game/list";  
	}

	@RequestMapping(value="/game/delete")
	String game_delete(GameDto dto)
	{
		service.delete(dto.getGAME_KEY());
		
		return "redirect:/game/list"; 
	}
	
	@RequestMapping(value="/game/modify")
	String game_modify(GameDto dto, Model model)
	{
		model.addAttribute("GameDto", service.getView(dto.getGAME_KEY()+""));
		
		return "game/gamewrite";
	}
	
}
