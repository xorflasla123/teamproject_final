package com.helloworld.root.mybatis.member;

import java.util.ArrayList;

import com.helloworld.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO user_check(String id);
<<<<<<< HEAD

	public int register(MemberDTO dto);
=======
	public ArrayList<MemberDTO> userInfo();
	public MemberDTO info(String userId);
	
>>>>>>> 73508cf5940214771453bccc8e3f2a4ebdc86ae9
}
