package com.helloworld.root.member.mail;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	@Bean
	public JavaMailSender mailSender() {
		JavaMailSenderImpl jms = new JavaMailSenderImpl();
		jms.setHost("smtp.gmail.com"); //google smtp 서버 
		jms.setPort(587); //google 메일 서버 포트
		jms.setUsername("rlatifhs7@gmail.com");
		jms.setPassword("ksr^*^3651");
		
		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true"); //사용자 인증 
		prop.setProperty("mail.smtp.starttls.enable", "true"); //보안 
		
		jms.setJavaMailProperties(prop); //jms에 설정 
		return jms;
	}

}
