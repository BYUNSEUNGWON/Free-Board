package com.rosena99.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rosena99.domain.HospitalCriteria;
import com.rosena99.domain.HospitalReplyVO;
import com.rosena99.domain.HospitalVO;
import com.rosena99.service.HospitalReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hospital/replies/*")
@Log4j
@AllArgsConstructor
public class HospitalReplyController {

	private HospitalReplyService service;
	
	@PostMapping(value = "/register")
	public String register(HospitalReplyVO replyVo, HospitalCriteria cri){
		
		service.register(replyVo);
		
		return "redirect:/hospital/get"+cri.getListLink()+"&bno="+replyVo.getBno();
	}
	
	@PostMapping("/modify")
	public String modify(HospitalReplyVO replyVo, @ModelAttribute("cri") HospitalCriteria cri) {
		
		service.modify(replyVo);
		
		return "redirect:/hospital/get"+cri.getListLink()+"&bno="+replyVo.getBno();
	}

	
	@PostMapping("/remove")
	public String remove(HospitalReplyVO replyVo, @ModelAttribute("cri") HospitalCriteria cri) {
		
		service.remove(replyVo);
		
		return "redirect:/hospital/get"+cri.getListLink()+"&bno="+replyVo.getBno();
	}
}
