package com.helloworld.root.member.service;



import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import com.helloworld.root.member.dto.MemberDTO;

	 

public interface MemberService {
	
	public int user_check(HttpServletRequest request);
	public void userInfo(Model model);
	public void info(String userId, Model model);
	public int register(MemberDTO dto);
	
	public int modify(MemberDTO dto);
	public void delete(String id);
	
	
	

}
