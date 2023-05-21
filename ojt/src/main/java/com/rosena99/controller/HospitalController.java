package com.rosena99.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rosena99.domain.HospitalVO;
import com.rosena99.domain.HospitalCriteria;
import com.rosena99.domain.HospitalPageDTO;
import com.rosena99.service.HospitalReplyService;
import com.rosena99.service.HospitalService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hospital/*")
@Log4j
@AllArgsConstructor
public class HospitalController {

	private HospitalService service;
	private HospitalReplyService replyService;
	
	@GetMapping("/list")
	public void list(HospitalCriteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info(total);
		model.addAttribute("pageMaker", new HospitalPageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(HospitalVO hospital, RedirectAttributes rttr) {
		
		service.register(hospital);
		
		rttr.addFlashAttribute("result", hospital.getBno());
		
		return "redirect:/hospital/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") HospitalCriteria cri, Model model) {
		model.addAttribute("hospital", service.get(bno));
		//댓글목록
		model.addAttribute("replyList", replyService.getList(cri, bno));
		
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") HospitalCriteria cri, Model model) {
		model.addAttribute("hospital", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(HospitalVO hospital, @ModelAttribute("cri") HospitalCriteria cri, RedirectAttributes rttr) {
		
		if(service.modify(hospital)) {
			rttr.addFlashAttribute("result", "success");
		}	

		
		return "redirect:/hospital/list"+cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") HospitalCriteria cri, RedirectAttributes rttr) {
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/hospital/list"+cri.getListLink();
	}
}
