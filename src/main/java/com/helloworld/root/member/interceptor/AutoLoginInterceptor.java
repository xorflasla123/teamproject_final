package com.helloworld.root.member.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.helloworld.root.member.dto.MemberDTO;
import com.helloworld.root.member.service.MemberService;
import com.helloworld.root.member.session_name.MemberSessionName;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter implements MemberSessionName{
	@Autowired MemberService ms;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("인터셉터 테스트");
		Cookie cookie = WebUtils.getCookie(request, "loginCookie");
		
		if(cookie != null) {
			//System.out.println(cookie.getValue());
			MemberDTO dto = ms.getUserSessionId(cookie.getValue());
			
			if(dto != null) {
				request.getSession().setAttribute(LOGIN, dto.getId());
			}
		}
		return true;
	}
}
