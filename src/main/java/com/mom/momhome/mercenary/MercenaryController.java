package com.mom.momhome.mercenary;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MercenaryController {

	@Resource(name="mercenaryService")
	MercenaryService service;
	
	@RequestMapping(value="/mercenary/list", method=RequestMethod.GET)
	String mercenary_list(Model model, MercenaryDto dto)
	{
		System.out.println("선택: " + dto.getKey());
		System.out.println("선택: " + dto.getKeyword());
		
		dto.setStart(dto.getPg()*10);
		
		List<MercenaryDto> list = service.getList(dto);
		
		for(MercenaryDto tempdto: list)
			System.out.println(tempdto.getMercenary_title());
		
		model.addAttribute("mercenaryList",list);
		model.addAttribute("totalCnt",service.getTotal(dto));
		return "mercenary/mercenary_list"; 
	}
	
	@RequestMapping(value="/mercenary/view", method=RequestMethod.GET)
	String mercenary_view(String mercenary_key, Model model)
	{
		MercenaryDto dto = service.getView(mercenary_key);
		model.addAttribute("mercenaryDto", dto);
		return "mercenary/mercenary_view";
	}
	
	@RequestMapping(value="/mercenary/write")
	String mercenary_write(Model model)
	{
		model.addAttribute("mercenaryDto", new MercenaryDto());
		return "mercenary/mercenary_write";
	}
	
	@RequestMapping(value="/mercenary/save")
	@ResponseBody
	String mercenary_save(MercenaryDto dto)
	{
		if(dto.getMercenary_key().equals(""))
			service.insert(dto);
		else
			service.update(dto);
		return "redirect:/mercenary/list";
	}
	
	@RequestMapping(value="/mercenary/delete")
	String mercenary_delete(String mercenary_key)
	{
		service.delete(mercenary_key);
		return "redirect:/mercenary/list";
	}
	
	@RequestMapping(value="/mercenary/modify")
	String mercenary_modify(String mercenary_key, Model model)
	{
		model.addAttribute("mercenaryDto",service.getView(mercenary_key));
		return "mercenary/mercenary_write";
	}
	
	
	
	
	

}
