
package com.helloworld.root.member.controller;


import javax.servlet.http.HttpServletRequest;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.helloworld.root.member.service.MemberService;
import com.helloworld.root.member.session_name.MemberSessionName;

@Controller
@RequestMapping("member")

public class MemberController implements MemberSessionName{
	@Autowired MemberService ms;
	

	@GetMapping("/login")
	public String login() {
		System.out.println("로그인 실행");
		return "member/login";
	}
	

	@PostMapping("/user_check")
	public String user_check(HttpServletRequest request, RedirectAttributes rs) {
		int result = ms.user_check(request);
		if(result == 0) {
			rs.addAttribute("id", request.getParameter("id"));
			System.out.println("로그인 성공");
			rs.addAttribute("autoLogin", request.getParameter("autoLogin"));
			return "redirect:successLogin";
		}
		System.out.println("로그인 실패");
		return "redirect:login";
	}
		
	@RequestMapping("/successLogin")
	public String successLogin(@RequestParam String id, 
								@RequestParam(value="autoLogin", required = false) String autoLogin, 
								HttpSession session, HttpServletResponse response) {
		session.setAttribute(LOGIN, id);
		
		if(autoLogin != null) {
			int limitTime = 60*60*24*30; // 30일
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			//long expiredDate = System.currentTimeMillis() + (limitTime*1000);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new java.util.Date());
			cal.add(Calendar.MONTH, 1);
			
			Date limitDate = new Date(cal.getTimeInMillis());
			ms.keepLogin(session.getId(), limitDate, id);
		}

		return "/index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response,
							@CookieValue(value="loginCookie", required=false) Cookie loginCookie) {
		if(session.getAttribute(LOGIN) != null) {
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				ms.keepLogin("nono", new Date(System.currentTimeMillis()),
								(String)session.getAttribute(LOGIN));
			}
			
			session.invalidate();
		}
		return "redirect:/index";
	}
	
	@GetMapping("register_form")
	public String register() {
		return "member/register";
	}
	
	@GetMapping("/userInfo")
	public String userInfo(Model model) {
		ms.userInfo(model);
		return "member/userInfo";
	}
	
	@GetMapping("/info")
	public String info(@RequestParam("id") String userId, Model model) {
		ms.info(userId, model);
		return "member/info";
	}
	
	@GetMapping("save")
	public String save(Model model) {
		
		return "redirect:/member/userInfo";
	}
	
	@GetMapping("/forgotId")
	public String forgotId() {
		System.out.println("아이디 찾기 실행");
		return "member/forgotId";
	}
	
	@PostMapping("/id_check")
	public void id_check(HttpServletRequest request, RedirectAttributes rs, HttpServletResponse response,
						HttpSession session) throws Exception {
		int result = ms.id_check(request);
		
		if(result == 0) {
			session.setAttribute("email", request.getParameter("email"));
			System.out.println("아이디찾기 이메일 인증 성공");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('메일이 발송 되었습니다. 메일을 확인하세요.'); location.href='/root/sendId';</script>");
			
			//return "member/login";
		}
		else {
			System.out.println("아이디찾기 이메일 인증 실패");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록된 이메일이 없습니다.'); location.href='forgotId'</script>");
			
			//return "member/forgotId"; 
		}
	}
	
	@GetMapping("/forgotPwd")
	public String forgotPwd() {
		System.out.println("비밀번호 찾기 실행");
		return "member/forgotPwd";
	}
	
	@PostMapping("/pwd_check")
	public void pwd_check(HttpServletRequest request, RedirectAttributes rs, HttpServletResponse response) throws Exception {
		int result = ms.pwd_check(request);
		if(result == 0) {
			rs.addAttribute("email", request.getParameter("email"));
			System.out.println("비밀번호찾기 이메일 인증 성공");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('메일이 발송 되었습니다. 메일을 확인하세요.'); location.href='/root/sendPwd';</script>");
			
			//return "member/login";
		}
		else {
			System.out.println("비밀번호찾기 이메일 인증 실패");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록된 이메일이 없습니다.'); location.href='forgotPwd'</script>");
			
			//return "member/forgotPwd"; 
		}
	}
}
