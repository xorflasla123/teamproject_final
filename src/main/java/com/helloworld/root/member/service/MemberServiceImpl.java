package com.helloworld.root.member.service;


import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helloworld.root.member.dto.MemberDTO;
import com.helloworld.root.message.MessageDTO;
import com.helloworld.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberMapper mapper;
	
	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
		
		if(dto != null) {
			if(request.getParameter("pwd").equals(dto.getPwd())) {
				return 0;
			}
		}
		return 1;
	}

	@Override
	public int register(MemberDTO dto) {
		//BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); //비밀번호 안보이게 설정 
		
		// dto.setPw(encoder.encode(dto.getPw())); 아래와 같음 
		System.out.println("비밀번호 변경 전 : "+dto.getPwd());
	//	String pwd = encoder.encode(dto.getPwd());
	//	System.out.println("암호화 후 :"+pwd);
		
	//	dto.setPwd(pwd);
		System.out.println(dto.getAddr());
		
		try{
		return mapper.register(dto);
		}catch(Exception e) {
			e.printStackTrace();
		return 0;
	}

}
	@Override
	public void userInfo(Model model) {
		ArrayList<MemberDTO> list = mapper.userInfo();
		model.addAttribute("memberList", list);	
	}

	@Override
	public void info(String userId, Model model) {
		model.addAttribute("info", mapper.info(userId));
	}




	@Override
	public int modify(MemberDTO dto) {
	
		try{
			return mapper.modify(dto);
			}catch(Exception e) {
				e.printStackTrace();
			return 0;
		}
	}

	@Override
	public void delete(String id) {
		try{
			mapper.delete(id);
			}catch(Exception e) {
				e.printStackTrace();
		
		}
		
	}

	






}
