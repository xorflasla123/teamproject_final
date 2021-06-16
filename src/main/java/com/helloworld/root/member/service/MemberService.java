package com.helloworld.root.member.service;



import javax.servlet.http.HttpServletRequest;

<<<<<<< HEAD
import com.helloworld.root.member.dto.MemberDTO;

public interface MemberService {
	public int user_check(HttpServletRequest request);
	 public int register(MemberDTO dto);
=======
import org.springframework.ui.Model;

public interface MemberService {
	public int user_check(HttpServletRequest request);
	public void userInfo(Model model);
	public void info(String userId, Model model);
>>>>>>> 73508cf5940214771453bccc8e3f2a4ebdc86ae9

}
