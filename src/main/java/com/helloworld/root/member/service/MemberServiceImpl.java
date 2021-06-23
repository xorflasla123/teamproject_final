package com.helloworld.root.member.service;


import java.sql.Date;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import org.springframework.ui.Model;


import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helloworld.root.member.dto.MemberDTO;
import com.helloworld.root.message.MessageDTO;

import org.springframework.web.bind.annotation.RequestMapping;


import com.helloworld.root.member.dto.MemberDTO;

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
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); //비밀번호 안보이게 설정 
		
		 //dto.setPw(encoder.encode(dto.getPw())); 아래와 같음 
		System.out.println("비밀번호 변경 전 : "+dto.getPwd());
		String pwd = encoder.encode(dto.getPwd());
		System.out.println("암호화 후 :"+pwd);
		
		dto.setPwd(pwd);
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
	


	@Override
	public void keepLogin(String sessionId, Date limitDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("id", id);
		mapper.keepLogin(map);
		
	}

	@Override
	public MemberDTO getUserSessionId(String sessionId) {
		
		return mapper.getUserSessionId(sessionId);
	}


	@Override
	public String id_check(HttpServletRequest request) {
		MemberDTO dto = mapper.id_check(request.getParameter("email"));
		
		if(dto != null) {
			if(request.getParameter("email").equals(dto.getEmail())) {
				String id = dto.getId();
				return id;
			}
		}
		return null;
	}


	@Override
	public String pwd_check(HttpServletRequest request) {
		MemberDTO dto = mapper.pwd_check(request.getParameter("email"));
		
		if(dto != null) {
			if(request.getParameter("email").equals(dto.getEmail())) {
				return dto.getPwd();
			}
		}
		return null;
	}

	@Override
	public int id_chk(String id) {
			ArrayList<MemberDTO> list = mapper.idChk(id);
			System.out.println(list.size());
			if(list.size()==0) {
				return 1;
			}else {
				return 0;
			}
	}
	




}
