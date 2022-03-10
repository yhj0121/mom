package com.mom.momhome.mercenary;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.momhome.mercenaryjoin.MercenaryjoinDto;

@Controller
public class MercenaryController {

	@Resource(name="mercenaryService")
	MercenaryService service;
	
	//용병구인글 목록
	@RequestMapping(value="/mercenary/list", method=RequestMethod.GET)
	String mercenary_list(Model model, MercenaryDto dto)
	{
		/*
		 * System.out.println("선택: " + dto.getKey()); System.out.println("선택: " +
		 * dto.getKeyword());
		 */
		
		dto.setStart(dto.getPg()*10);
		
		List<MercenaryDto> list = service.getList(dto);
		
		/*
		 * for(MercenaryDto tempdto: list)
		 * System.out.println(tempdto.getMercenary_title());
		 */
		
		model.addAttribute("mercenaryList",list);
		model.addAttribute("totalCnt",service.getTotal(dto));
		return "mercenary/mercenary_list"; 
	}
	
	//용병 구인글 상세보기
	@RequestMapping(value="/mercenary/view", method=RequestMethod.GET)
	String mercenary_view(String mercenary_key, Model model)
	{
		MercenaryDto dto = service.getView(mercenary_key);
		model.addAttribute("mercenaryDto", dto);
		return "mercenary/mercenary_view";
	}
	
	//용병 구인글 작성
	@RequestMapping(value="/mercenary/write")
	String mercenary_write(Model model)
	{
		model.addAttribute("mercenaryDto", new MercenaryDto());
		return "mercenary/mercenary_write";
	}
	
	//용병 구인글 저장
	@RequestMapping(value="/mercenary/save", produces = "application/text; charset=UTF-8")
	@ResponseBody
	String mercenary_save(MercenaryDto dto)
	{
		//game_key가 있는지 확인해서 존재하면 해당 게임에 대한 새로운 구인글 작성 제한
		int result = service.checkDuplicate(dto);
		String res = null;
		//mercenary 테이블에 game_key가 있고 mercenary_key가 없어야 하나의 게임에 대한 중복글 작성 가능.
		if(result != 0 && dto.getMercenary_key().equals("")){
			res = "해당 게임에 대한 구인글이 이미 존재합니다.";
		}else {
			if(dto.getMercenary_key().equals(""))
			{
				service.insert(dto);
				res = "게시글 작성 완료";
			}else {
				 service.update(dto); 
				 res = "게시글 수정 완료"; 
			}
		}
		
		return res;
	}
	

	//용병 구인글 삭제
	@RequestMapping(value="/mercenary/delete")
	String mercenary_delete(String mercenary_key)
	{
		service.delete(mercenary_key);
		return "redirect:/mercenary/list";
	}
	
	//용병 구인글 수정
	@RequestMapping(value="/mercenary/modify")
	String mercenary_modify(String mercenary_key, Model model)
	{
		model.addAttribute("mercenaryDto",service.getView(mercenary_key));
		return "mercenary/mercenary_write";
	}
	
	//용병 신청
	@RequestMapping(value="/mercenary/apply")
	@ResponseBody
	String mercenary_apply(MercenaryjoinDto dto)
	{
		service.insertJoin(dto);
		return "redirect:/mercenary/list";
	}
	
	//용병 신청한 선수 리스트 보기-감독권한
	@RequestMapping(value="/mercenary/viewApplicants")
	@ResponseBody
	List<MercenaryjoinDto> mercenary_viewApplicants(MercenaryjoinDto dto)
	{
		List<MercenaryjoinDto> appList = service.getApplicantsList(dto);
		return appList;
	}
	
	//용병 신청한 선수 승인, 거절
	@RequestMapping(value="/mercenary/proc")
	@ResponseBody
	String mercenary_proc(MercenaryjoinDto dto)
	{
		service.updateJoin(dto);
		return "/mercenary/view";
	}
	
	//게임 정보 가져오기
	@RequestMapping("/mercenary/selectGame")
	@ResponseBody
	List<MercenaryDto> getGameList(String user_key)
	{
		System.out.println("여기로 들어왔니?");
		List<MercenaryDto> gameList = service.getGameList(user_key);
		
		 for(MercenaryDto temp: gameList)
			 System.out.println(temp.getGame_key());
		return gameList;
	}
	
	//라인업 테이블에서 용병수 가져오기
	@RequestMapping(value="/mercenary/count")
	@ResponseBody
	Integer mercenary_count(String game_key, Model model)
	{
		int count = service.getMsCount(game_key);
		return count;
	}

}
