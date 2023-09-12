package com.jumpstart.services;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	
	@Autowired
	private JavaMailSender javaMailSender;
	
//	----------
//	SEND EMAIL
//	----------
	public void sendEmail(String recipient, String subject, String body)
		throws UnsupportedEncodingException, MessagingException {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("sn.taisho@gmail.com");
		helper.setTo(recipient);
		helper.setSubject(subject);
		helper.setText(body, true);
		
//		javaMailSender.send(message);
		
		System.out.println("Email sent successfully");
	}
}
