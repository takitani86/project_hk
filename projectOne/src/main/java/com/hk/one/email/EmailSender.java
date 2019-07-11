package com.hk.one.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
   
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;
	
	public void SendEmail(Email email) throws Exception {
         
		MimeMessage msg = javaMailSenderImpl.createMimeMessage();
        
        try {
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            //msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse("jkl7487@gmail.com"));
        } catch (MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        try {
            mailSender.send(msg);
        } catch (MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
    }
}