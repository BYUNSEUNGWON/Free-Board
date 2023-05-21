package com.rosena99.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rosena99.domain.AuthVO;
import com.rosena99.domain.BoardVO;
import com.rosena99.domain.Criteria;
import com.rosena99.domain.MemberVO;
import com.rosena99.domain.PageDTO;
import com.rosena99.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@AllArgsConstructor
public class CommonController {
	
	private BCryptPasswordEncoder passwordEncoder;
	
	private MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if(logout != null) {
			model.addAttribute("logout", "logout !");
		}
	}
	
	
	
	
	/*
	 * 403에러페이지
	 * @param auth
	 * @param model
	 * */
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied :" + auth);
		model.addAttribute("msg", "Access Denied");
		
	}
	
	/**
	 * 로그아웃 Get방식으로 처리
	 */
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom Logout");
	}
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(Locale locale, Model model) {
		
		
	}*/
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/sign")
	public void sign() {
		
	}
	
	@PreAuthorize("isAnonymous()")
	@PostMapping("/sign")
	public String register(MemberVO vo, AuthVO auth) {
		List<AuthVO> authList = new ArrayList<>();
		authList.add(auth);
		vo.setAuthList(authList);
				
		String userpw = passwordEncoder.encode(vo.getUserpw());
		
		vo.setUserpw(userpw);
		service.register(vo);							
		
		return "redirect:/customLogin";
	}
	
	@PostMapping("/forget")
	public String forget(MemberVO vo) {

		String userpw = passwordEncoder.encode(vo.getUserpw());
		
		vo.setUserpw(userpw);
		service.forget(vo);
		
		return "redirect:/customLogin";
	}
	
	@GetMapping("/forget")
	public void forget() {
		
	}
	
	@GetMapping("/memberModify")
	public void memberModify(@RequestParam("userid") String userid, Model model) {
		model.addAttribute("board", service.get(userid));
	}
	
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/memberList")
	public void memberList(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
	}
	
	
	@GetMapping("/memberGet")
	public String profileEdit(Model model, Principal prin) {
		model.addAttribute("member", service.getMemberById(prin.getName()));
		return "memberGet";
	}
	
	@PostMapping("/memberGet")
	public String modify(MemberVO member) {
		
		service.modify(member);
		
		//rttr.addFlashAttribute("result", member.getMemberId());
		return "redirect:/memberGet";
	}
	
	@GetMapping("/game")
	public void game() {
		
	}
	
}
