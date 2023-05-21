package com.rosena99.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rosena99.domain.DaangnVO;
import com.rosena99.domain.DaangnCriteria;
import com.rosena99.domain.PageDTO;
import com.rosena99.service.DaangnService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/daangn/*")
@Log4j
@AllArgsConstructor
public class DaangnController {
	
	private DaangnService service;
	
	@GetMapping("/list")
	public void list(DaangnCriteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info(total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(DaangnVO daangn, RedirectAttributes rttr) {
		service.register(daangn);
		
		rttr.addFlashAttribute("result", daangn.getBno());
		
		return "redirect:/daangn/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") DaangnCriteria cri, Model model) {
		model.addAttribute("daangn", service.get(bno));
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") DaangnCriteria cri, Model model) {
		model.addAttribute("daangn", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(DaangnVO daangn, @ModelAttribute("cri") DaangnCriteria cri, RedirectAttributes rttr) {
		
		if(service.modify(daangn)) {
			rttr.addFlashAttribute("result", "success");
		}	

		
		return "redirect:/daangn/list"+cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") DaangnCriteria cri, RedirectAttributes rttr) {
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/daangn/list"+cri.getListLink();
	}
	
	@GetMapping("/removeAdmin")
	public String removeAdmin(String [] bno) {
		
		for (String strBno : bno) {
			Long longBno = Long.parseLong(strBno);
			service.remove(longBno);
		}
		
		return "redirect:/daangn/list";
	}
}
