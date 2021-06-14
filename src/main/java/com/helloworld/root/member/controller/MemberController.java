package com.helloworld.root.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {
	@GetMapping("login")
	public String login() {
		System.out.println("login 실행");
		return "member/login";
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
