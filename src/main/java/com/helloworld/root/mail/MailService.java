package com.helloworld.root.mail;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

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

}
