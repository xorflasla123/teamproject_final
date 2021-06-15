package com.helloworld.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.helloworld.root.member.service.MemberService;
import com.helloworld.root.member.session_name.MemberSessionName;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{
	@Autowired MemberService ms;
	
	@GetMapping("login")
	public String login() {
		System.out.println("login 실행");
		return "member/login";
	}
	
	@PostMapping("user_check")
	public String user_check(HttpServletRequest request, RedirectAttributes rs) {
		int result = ms.user_check(request);
		
		if(result == 0) {
			rs.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam String id, HttpSession session) {
		session.setAttribute(LOGIN, id);
		return "/index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if(session.getAttribute(LOGIN) != null) {
			session.invalidate();
		}
		return "redirect:/index";
	}
	
	@GetMapping("register_form")
	public String register() {
		return "member/register";
	}
	
	@GetMapping("userInfo")
	public String userInfo() {
		return "member/userInfo";
	}
}
