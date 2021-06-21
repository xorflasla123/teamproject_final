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
