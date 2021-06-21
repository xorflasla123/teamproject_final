package com.helloworld.root.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			rs.addAttribute("autoLogin", request.getParameter("autoLogin"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam String id, 
								@RequestParam(value="autoLogin", required = false) String autoLogin, 
								HttpSession session, HttpServletResponse response) {
		session.setAttribute(LOGIN, id);
		
		if(autoLogin != null) {
			int limitTime = 60*60*24*30; // 30일
			Cookie loginCookie = new Cookie("loginCookie", id);
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
		}
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
	public String userInfo(Model model) {
		ms.userInfo(model);
		return "member/userInfo";
	}
	
	@GetMapping("info")
	public String info(@RequestParam("id") String userId, Model model) {
		ms.info(userId, model);
		return "member/info";
	}
	
	@GetMapping("save")
	public String save(Model model) {
		
		return "redirect:/member/userInfo";
	}
}
