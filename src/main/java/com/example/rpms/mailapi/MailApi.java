package com.example.rpms.mailapi;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

public class MailApi {

	public void mail(String subject, String body, String email) {

		final String fromEmail = "dscdemo0@gmail.com"; // requires valid
																// gmail id
		final String password = "Jaipur@123"; // correct password for gmail id
		final String toEmail = email; // can be any email id
		
	//	String host = "127.0.0.1";   
		
		System.out.println("SSLEmail Start");
		Properties props = new Properties();
		//props.put("mail.smtp.host", host);//"smtp.gmail.com"); // SMTP Host
	
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

	/*	Authenticator auth = new Authenticator() {
			// override the getPasswordAuthentication method
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};

		Session session = Session.getDefaultInstance(props, auth);
		*/
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(fromEmail, password);
		    }
		});
		
		sendEmail(session, toEmail, subject, body);
		/*// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(
					to));
			message.setSubject(msg);
			message.setText(subject);

			// send the message
			Transport.send(message);

			System.out.println("message sent successfully...");

		} catch (MessagingException e) {
			e.printStackTrace();
		}*/

	}
	
	public void sendEmail(Session session, String toEmail, String subject, String body){
        try
        {
          MimeMessage msg = new MimeMessage(session);
          //set message headers
          msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
          msg.addHeader("format", "flowed");
          msg.addHeader("Content-Transfer-Encoding", "8bit");
 
          msg.setFrom(new InternetAddress("from-email@gmail.com"));
          
          msg.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("to-email@gmail.com"));
 
          msg.setSubject(subject);
 
          msg.setText(body);
 
          // msg.setSentDate(new Date());
 
          msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
          msg.setRecipients(Message.RecipientType.CC, "neelam@ukitss.com");
          System.out.println("Message is ready");
          Transport.send(msg);  
 
          System.out.println("EMail Sent Successfully!!");
        }
        catch (Exception e) {
          e.printStackTrace();
        }
    }
}
