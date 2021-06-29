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
		jms.setHost("smtp.gmail.com");
		jms.setPort(587);
		jms.setUsername("team5helloworld@gmail.com");
		jms.setPassword("xlavkdlqm!");
		
		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true"); //사용자 인증을 하겠다
		prop.setProperty("mail.smtp.starttls.enable", "true"); //보안관련 설정을 하겠다
		
		jms.setJavaMailProperties(prop);
		return jms;
	}

}
