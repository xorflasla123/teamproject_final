package com.helloworld.root.member.mail;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MailService {
	@Autowired
	JavaMailSender mailSender;
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper me = new MimeMessageHelper(message, true, "UTF-8");
			me.setSubject(subject); //타이틀
			me.setTo(to); //보내는곳
			me.setText(body, true); //내용
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String auth( String email,HttpServletRequest request, Model model) {

		String userkey = rand();
		model.addAttribute("userkey", userkey);
		System.out.println(email);
		String body =
		"회원님의 인증번호는 "+userkey+" 입니다";
		sendMail(email,"HelloWorld인증번호",body);
		return userkey;
		}
	    public String rand() {
	    	Random ran = new Random();
	    	String str="";
	    	int num;
	    	while(str.length() != 6) {
	    		num = ran.nextInt(75)+48;
	    		if((num >= 48 && num <= 57) ) {
	    			str+= (char)num;	    			
	    		}
	    	}
	    	return str;
	    }
}
