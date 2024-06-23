package com.psvm.mail;

import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.psvm.member.vo.Member;

/*
 *Email Protocol
 *SMTP
 *이메일을 전송할 때 사용하는 프로토콜
 *
 *POP
 *이메일 서버에 도착한 메일을 클라이언트로 가져올 때 사용하는 프로토콜
 *
 *IMAP
 *이메일 서버에 직접 접속하여 이메일을 확인할 때 사용하는 프로토콜
 *(gmail의 SMTP를 이용하기위해서는 IMAP를 사용으로 해줘야한다.)
 */

public class Email {
	public static void sendEmail(Member m, String Vcode){
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername("dlghdus1949@gmail.com");
		sender.setPassword("kful xdsi kvtk excw");
	
		//옵션설정
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starttls.enable", true);
		
		sender.setJavaMailProperties(prop);
		
		//메시지생성
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject("인증번호 전송");
		message.setText("당신의 인증번호는 " + Vcode + "입니다.");
		
		String[] to = {m.getEmail()};
		message.setTo(to);
		
		String[] cc = {m.getEmail()};
		message.setCc(cc);
		
		sender.send(message);
	}
}
