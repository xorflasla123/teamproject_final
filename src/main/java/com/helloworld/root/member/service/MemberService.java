package com.helloworld.root.member.service;



import javax.servlet.http.HttpServletRequest;

import com.helloworld.root.member.dto.MemberDTO;

public interface MemberService {
	public int user_check(HttpServletRequest request);
	 public int register(MemberDTO dto);

}
