package com.mom.momhome.game;

import java.util.HashMap;
import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.momhome.gamejoin.GameJoinDto;
import com.mom.momhome.mercenary.MercenaryDto;


@Controller
public class GameController {

	@Resource(name="gameService")
	GameService service;
	
	

	
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
	String view(Model model,String game_key)
	{

		GameDto dto = service.getView(game_key);
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
	@ResponseBody
	String board_save(GameDto dto)
	{
			
		if(dto.getGame_key().equals(""))
			service.insert(dto);
		else
			service.update(dto);
		return "redirect:/game/list";  
	}

	@RequestMapping(value="/game/delete")
	String game_delete(GameDto dto)
	{
		service.delete(dto.getGame_key());
		
		return "redirect:/game/list"; 
	}
	
	@RequestMapping(value="/game/modify")
	String game_modify(GameDto dto, Model model)
	{
	
		model.addAttribute("GameDto", service.getView(dto.getGame_key()));
		
		return "game/gamewrite";
	}
	
	@RequestMapping(value="/game/apply")
	@ResponseBody
	String gamejoin_insert(GameJoinDto dto)
	{
		System.out.println("insert 시작부분");
		service.gameinsertJoin(dto);
		System.out.println(dto.getGame_key()+"+++++++++++++++++++++++++");
		return "redirect:/game/list";  
		
	}
	
	@RequestMapping(value="/game/applyview")
	List<GameJoinDto>  gamejoin_list(GameJoinDto dto)
	{
		List<GameJoinDto> getlistJoin = service.getListJoin(dto);
		return getlistJoin;
	}
	
	@RequestMapping(value="/game/proc")
	@ResponseBody
	String game_apply(GameJoinDto dto)
	{
		service.updateJoin(dto);
		return "/game/gameview";
	}
	
}
