package com.helloworld.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberService {
	public int user_check(HttpServletRequest request);
	public void userInfo(Model model);
	public void info(String userId, Model model);

}
