package com.helloworld.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.helloworld.root.member.session_name.MemberSessionName;

public class MemberInterceptor extends HandlerInterceptorAdapter implements MemberSessionName{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("컨트롤 전 인터셉터");
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 해주세요'); location.href='login';</script>");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//System.out.println("컨트롤 후 인터셉터");
	}
}
