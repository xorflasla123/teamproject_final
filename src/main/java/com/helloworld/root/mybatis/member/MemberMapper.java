package com.helloworld.root.mybatis.member;


import com.helloworld.root.member.dto.MemberDTO;

import java.util.ArrayList;
import java.util.Map;


public interface MemberMapper {
	public MemberDTO user_check(String id);
	public ArrayList<MemberDTO> userInfo();
	public MemberDTO info(String userId);
	public void keepLogin(Map<String, Object> map);
	public MemberDTO getUserSessionId(String sessionId);
	
	public MemberDTO id_check(String email);
	public MemberDTO pwd_check(String email);
	
}
