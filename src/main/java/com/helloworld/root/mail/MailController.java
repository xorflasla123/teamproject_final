package com.helloworld.root.mail;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MailController {
	@Autowired
	MailService ms;
	
	@GetMapping("sendId")
	public String sendId(HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("메일이 전송 되었습니다");
		
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<h1>Hello World</h>");
		sb.append("<h2>요청하신 회원님의 아이디는 </h2>");
		sb.append("<h4>"+(String)session.getAttribute("idChk")+"</h4>");
		sb.append("<h2> 입니다.</h2>");
		sb.append("</body></html>");
		
		String message = sb.toString();
		
		ms.sendMail((String)session.getAttribute("email"), "Hello World", message);
		session.removeAttribute("email");
		
		return "/member/login";
	}
	
	
	@GetMapping("sendPwd")
	public String sendPwd(HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("메일이 전송 되었습니다");
		
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<h1>Hello World</h>");
		sb.append("<h2>요청하신 회원님의 비밀번호는 </h2>");
		sb.append("<h4>"+(String)session.getAttribute("pwdChk")+"</h4>");
		sb.append("<h2> 입니다.</h2>");
		sb.append("</body></html>");
		
		String message = sb.toString();
		
		ms.sendMail((String)session.getAttribute("email"), "Hello World", message);
		session.removeAttribute("email");
		
		return "/member/login";
	}

}
