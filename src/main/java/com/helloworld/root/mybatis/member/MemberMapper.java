package com.helloworld.root.mybatis.member;

import java.util.ArrayList;

import com.helloworld.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO user_check(String id);


	public int register(MemberDTO dto);

	public ArrayList<MemberDTO> userInfo();
	public MemberDTO info(String userId);


	public int modify(MemberDTO dto);


	


	public void delete(String id);



}
