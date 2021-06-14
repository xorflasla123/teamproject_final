package com.helloworld.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface MemberService {
	public int user_check(HttpServletRequest request);

}
