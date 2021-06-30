package com.helloworld.root.member.mail;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		sb.append("<h4 style='color: red;'>"+(String)session.getAttribute("idChk")+"</h4>");
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
	

	   @GetMapping("auth_form")

	   public String authForm(@RequestParam String email, Model model ) {
		   model.addAttribute("email",email);
		   return "authentication";
		}
	   
	   @PostMapping("auth")
	   @ResponseBody
	   public String auth(@RequestBody String email,HttpServletRequest request,Model model) {
		   
		   String userkey = ms.auth( email, request,model);
		   System.out.println("22222");
		   return userkey;
		   
	   }
	   @GetMapping("auth_check")
	   public String auth_check(@RequestParam String userid,
			                   @RequestParam String userkey, HttpSession session ) {
		   String sessionKey = (String)session.getAttribute(userid);
		   if(sessionKey != null) {
			   if(sessionKey.equals(userkey)) {
				   session.setAttribute("userid", userid);
				   session.setAttribute("userkey", userkey);
			   }
		   }
		   return "redirect:auth_form";
	   }

}
