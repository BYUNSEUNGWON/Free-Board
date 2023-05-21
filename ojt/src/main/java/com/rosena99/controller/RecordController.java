package com.rosena99.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rosena99.domain.BoardVO;
import com.rosena99.domain.Criteria;
import com.rosena99.domain.PageDTO;
import com.rosena99.domain.RecordVO;
import com.rosena99.service.RecordService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/record/*")
@Log4j
@AllArgsConstructor
public class RecordController {
	
	RecordService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model, RecordVO vo) {
		model.addAttribute("list", service.getList(cri));
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(RecordVO record, RedirectAttributes rttr) {
		service.register(record);
		
		rttr.addFlashAttribute("result", record.getBno());
		
		return "redirect:/record/list";
	}
}
