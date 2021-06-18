package com.helloworld.root.member.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.helloworld.root.member.dto.MemberDTO;

public interface MemberService {
	public int user_check(HttpServletRequest request);
	public void userInfo(Model model);
	public void info(String userId, Model model);
	
	public void keepLogin(String sessionId, Date limitDate, String id);

	public MemberDTO getUserSessionId(String sessionId);
	
	public int id_check(HttpServletRequest request);
	public int pwd_check(HttpServletRequest request);
	
}
