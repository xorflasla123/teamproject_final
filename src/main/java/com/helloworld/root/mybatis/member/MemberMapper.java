package com.helloworld.root.mybatis.member;

import com.helloworld.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO user_check(String id);

	public int register(MemberDTO dto);
}
