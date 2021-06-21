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
	@GetMapping("sendmail")
	public String sendSipleMail(HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("메일이 전송 되었습니다");
		
		ms.sendMail((String)session.getAttribute("email"), "Hello World", "요청하신 회원님의 비밀번호입니다.");
		session.removeAttribute("email");
		
		return "/member/login";
	}

}
