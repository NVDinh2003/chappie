//package com.chappie.utils;
//
//import java.util.Properties;
//
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
//public class SendMail {
//	public static void main(String[] args) {
//		String to = "salamander4423@gmail.com";
//		String from = "iamdinhhtvq@gmail.com";
//		String host = "localhost";
//		Properties properties = System.getProperties();
//		properties.setProperty("mail.smtp.host", host);
//		Session session = Session.getDefaultInstance(properties);
//		try {
//			MimeMessage message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(from));
//			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//			message.setSubject("This is the Subject Line!");
//			message.setText("This is actual message");
//			Transport.send(message);
//			System.out.println("Sent message successfully....");
//		} catch (MessagingException mex) {
//			mex.printStackTrace();
//		}
//	}
//}
