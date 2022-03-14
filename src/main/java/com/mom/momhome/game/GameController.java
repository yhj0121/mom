package com.mom.momhome.game;

import java.util.HashMap;
import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.momhome.common.BaseDto;
import com.mom.momhome.gamejoin.GameJoinDto;
import com.mom.momhome.membership.MembershipDto;


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
	String view(Model model,GameDto dto)
	{
//		System.out.println("***__*_*_*_*_*_*_*_*_*_*_*");
//		System.out.println("gameController.View.team_key : " + dto.getTeam_key());
//		System.out.println("gameController.View.game_key : "+dto.getGame_key());
		
		GameDto viewDto = service.getView(dto.getGame_key());
		
		GameDto tdto = service.getMembershipUserkey(dto.getTeam_key());
//		System.out.println("gameController.View.user_key : "+tdto.getUser_key());
		
		model.addAttribute("teamdto", tdto);
		model.addAttribute("GameDto", viewDto);
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
		System.out.println(dto.getTeam_name());	
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
	@ResponseBody
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
		System.out.println("처리됨");
		System.out.println(dto.getResult_proc());
		return "/game/gameview";
	}
	
	@RequestMapping("/game/selectCity")
	@ResponseBody
	GameDto game_getCityList(String user_key)
	{
		System.out.println("도입전");
		GameDto dto = service.getCityList(user_key);
		System.out.println(dto);
		System.out.println("도입후");
		

	
		return dto;
	}
	
	@RequestMapping("/game/joinduplicate")
	@ResponseBody
	int gamejoin_duplicate(GameJoinDto dto)
	{	
		System.out.println("게임키" + dto.getGame_key());
		System.out.println("유저키" + dto.getUser_key());
		int count = service.GetCount(dto);
		System.out.println("카운트 값"+count);
		return count;
	}
	
	
	@RequestMapping("/game/joinresult")
	@ResponseBody
	int gamejoin_getMatchingjoin(GameJoinDto dto)
	{	
		//System.out.println("게임키" + dto.getGame_key());
		//System.out.println("유저키" + dto.getUser_key());
		int resultcount = service.getMatchingjoincount(dto);
		System.out.println("카운트 값"+resultcount);
		return resultcount;
	}
	
	

	/*
	 * @RequestMapping("/game/updatekey")
	 * 
	 * @ResponseBody GameDto game_teamkeyList(Model model,String user_key) { GameDto
	 * cnt = service.teamkeySelect(user_key); System.out.println("팀키 들어가기전");
	 * model.addAttribute("teamkeyList", cnt); System.out.println(cnt);
	 * 
	 * 
	 * 
	 * return dto; }
	 */
}
