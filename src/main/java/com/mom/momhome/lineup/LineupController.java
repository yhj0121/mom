package com.mom.momhome.lineup;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.momhome.game.GameDto;
import com.mom.momhome.gamejoin.GameJoinDto;
import com.mom.momhome.member.MemberDto;
import com.mom.momhome.membership.MembershipDto;

@Controller
public class LineupController {

	@Resource(name="lineupService")
	LineupService service;
	
	@RequestMapping(value = "/lineup/info", method = RequestMethod.GET)
	public String info(Model model, GameDto gameDto, HttpServletRequest request ) {
		
//      System.out.println("controller.GameKey: " + gameDto.getGame_key());
//      System.out.println("controller.TeamKey: " + gameDto.getTeam_key());
//      System.out.println("controller.TeamSide: " + gameDto.getTeam_side());
        
        List<LineupDto> list = service.getList(gameDto);
        for(LineupDto tempDto : list)
        {
            tempDto.getPlayerDto().setUser_key(tempDto.getUser_key());
            tempDto.setPlayerDto(service.getPlayer(tempDto.getUser_key())); 
            
//            System.out.println("LineupKey: " + tempDto.getLineup_key());
//            System.out.println("UserKey: " + tempDto.getUser_key());
//            System.out.println("UserID: " + tempDto.getPlayerDto().getUser_id());
        }

        model.addAttribute("gameDto", gameDto);
		model.addAttribute("lineupList", list);
		
		HttpSession session = request.getSession();
		String team_key = ((MembershipDto)session.getAttribute("membershipDto")).getTeam_key();
		
//		System.out.println("controller.GameKey: " + gameDto.getGame_key());
//		System.out.println("controller.membership.team_key: " + team_key);
		info_setGameJoinResult(model, gameDto.getGame_key(), team_key);
		
		return "lineup/lineup_info";
	}
	
	public void info_setGameJoinResult(Model model, String game_key, String team_key) 
	{
		GameJoinDto dto = new GameJoinDto();
		dto.setGame_key(game_key);
		dto.setTeam_key(team_key);
		model.addAttribute("gameJoinResult", service.getGameJoinResult(dto));
	}
	
//	@RequestMapping(value="/lineup/insert", method = RequestMethod.GET)
//	public void insert(LineupDto dto)
//	{
//		System.out.println("LineupController.insert");
//		service.insert(dto);
//	}
	
	@RequestMapping(value="/lineup/insert_lineupDummy", method = RequestMethod.GET)
	public void insert_lineupDummy()
	{
		System.out.println("LineupController.insert_lineupDummy");
		
		for(int i = 0; i < 5; i++)
		{
			LineupDto tempDto = new LineupDto();
			tempDto.setUser_key(String.valueOf((i*2 + 1)));
			tempDto.setTeam_key("1");
			tempDto.setGame_key("1");
			tempDto.setCode_key("GK");
			tempDto.setTeam_side("1");
			
//			service.insert(tempDto);
		}
	}
	
	@RequestMapping(value = "/lineup/dummydatas", method = RequestMethod.GET)
	public String dummyDatas() {
		return "lineup/lineup_dummydatas";
	}
	
	@RequestMapping(value="/lineup/insert_userDummy", method = RequestMethod.GET)
	public void insert_userDummy()
	{
		System.out.println("LineupController.insert_userDummy");
		for(int i = 1; i < 31; i++)
		{
			LineupPlayerDto tempDto = new LineupPlayerDto();
			tempDto.setUser_id("football_" + i);
			tempDto.setUser_password("1111");
			tempDto.setUser_name("홍길동_" + i);
			tempDto.setUser_mail("hong" + i + "@naver.com");
			tempDto.setUser_phone("010-0000-" + String.format("%04d", i));
			tempDto.setUser_address1("주소_" + i);
			tempDto.setUser_address2("상세주소_" + i);
			tempDto.setUser_position("GK");
			tempDto.setUser_intro("안녕하세요_" + i);
			
			service.insert_userDummy(tempDto);
		}
	}
	
	@RequestMapping(value="/lineup/insert_teamDummy", method = RequestMethod.GET)
	public void insert_teamDummy()
	{
		System.out.println("LineupController.insert_teamDummy");
		for(int i = 1; i < 3; i++)
		{
			LineupTeamDto tempDto = new LineupTeamDto();
			tempDto.setTeam_name("teamName_" + i);
			tempDto.setCode_key("KR");
			tempDto.setTeam_fee(i);
			tempDto.setTeam_intro("팀소개_" + i);
			tempDto.setTeam_emblem("");
			tempDto.setTeam_notice("공지_" + i);
			tempDto.setTeam_num(20);
			tempDto.setTeam_recruit_yn("N");
			
			service.insert_teamDummy(tempDto);
		}
	}
	
	@RequestMapping(value="/lineup/insert_membershipDummy", method = RequestMethod.GET)
	public void insert_membershipDummy()
	{
		System.out.println("LineupController.insert_membershipDummy");
		for(int i = 1; i < 31; i++)
		{
			LineupMembershipDto tempDto = new LineupMembershipDto();
			tempDto.setUser_key(i);
			tempDto.setTeam_key( ((i+1) % 2) + 1);
			
			if( (i % 15) == 1)
				tempDto.setMembership_role("1");
			else
				tempDto.setMembership_role("2");
			
			service.insert_membershipDummy(tempDto);
		}
	}
	
	@RequestMapping(value="/lineup/insert_gameDummy", method = RequestMethod.GET)
	public void insert_gameDummy()
	{
		System.out.println("LineupController.insert_gameDummy");
		//for(int i = 1; i < 31; i++)
		{
			LineupGameDto tempDto = new LineupGameDto();
			tempDto.setTeam_key(1);
			tempDto.setGame_location("KR");
			tempDto.setGame_title("경기_" + 1);
			tempDto.setGame_contents("경기설명_" + 1);
			
			service.insert_gameDummy(tempDto);
		}
	}
	
	@RequestMapping(value = "/lineup/modify", method = RequestMethod.GET)
	public String modify(GameDto gameDto, Model model) {
		
//		System.out.println("controller.GameKey: " + gameDto.getGame_key());
//      System.out.println("controller.TeamKey: " + gameDto.getTeam_key());
//	    System.out.println("controller.TeamSide: " + gameDto.getTeam_side());
	      
        List<LineupDto> list = service.getList(gameDto);
        for(LineupDto tempDto : list)
        {
//        	System.out.println("LineupKey: " + tempDto.getLineup_key());
//            System.out.println("UserKey: " + tempDto.getUser_key());
//            System.out.println("UserID: " + tempDto.getPlayerDto().getUser_id());
//            System.out.println("Lineup_index: " + tempDto.getLineup_index());
//            System.out.println("code_key: " + tempDto.getCode_key());
//            System.out.println("mercenary_state: " + tempDto.getMercenary_state());
            
        	String user_key = tempDto.getUser_key();
        	if(user_key != "")
        	{
        		tempDto.getPlayerDto().setUser_key(user_key);
        		tempDto.setPlayerDto(service.getPlayer(user_key));
        	}
        }
        
        model.addAttribute("gameDto", gameDto);
		model.addAttribute("lineupList", list);
		
		return "lineup/lineup_modify";
	}
	
	@RequestMapping("/lineup/modify/getPlayerList")
	@ResponseBody
	List<LineupPlayerDto> modify_getPlayerList(String team_key, Model model)
	{
		List<LineupPlayerDto> list = service.getPlayerList(team_key);
		//model.addAttribute("lineupPlayerList", list);
		return list; 
	}
	
	@RequestMapping(value="/lineup/modify/save")
	@ResponseBody
	public HashMap<String, String> modify_saveLineup(@RequestParam Map<String, Object> jsonDatas) 
	{
		service.saveLineups(jsonDatas);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping(value="/lineup/userInfo")
	public String getUserInfo(String user_key, Model model) 
	{
		MemberDto resultDto = service.getUserInfo(user_key);
//		System.out.println("user_key: " + user_key);
//		System.out.println("resultDto: " + resultDto);
//		System.out.println("resultDto.userName: " + resultDto.getUser_name());
		model.addAttribute("userInfo", resultDto);

		return "lineup/lineup_userInfo";
	}
	
}


















