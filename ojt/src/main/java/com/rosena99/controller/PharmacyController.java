package com.rosena99.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rosena99.domain.PageDTO;
import com.rosena99.domain.PharmacyCriteria;
import com.rosena99.domain.PharmacyPageDTO;
import com.rosena99.domain.PharmacyVO;
import com.rosena99.service.PharmacyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/pharmacy/*")
@Log4j
public class PharmacyController {

	private PharmacyService service;
	
	@GetMapping("/list")
	public String getList(PharmacyCriteria cri, Model model) {
		
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PharmacyPageDTO(cri, total));
		
		return "pharmacy/list";
	}
	
	@GetMapping("/register")
	public void getRegister() {
		
	}
	
	@PostMapping("/register")
	public String register(PharmacyVO vo) {
		
		service.register(vo);
		
		return "redirect:/pharmacy/list";
	}
			
}




