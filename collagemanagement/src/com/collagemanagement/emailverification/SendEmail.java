package com.collagemanagement.emailverification;

import java.util.Properties;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail implements Runnable
{
		// TODO Auto-generated method stub
	
//	    public  void sendmail(String mail, String msg)
//	    {
//		final String username = "divyeshakabari01@gmail.com";
//		final String password = "Divyesh1234";
//
//		Properties prop = new Properties();
//		prop.put("mail.smtp.host", "smtp.gmail.com");
//		prop.put("mail.smtp.port", "465");
//		prop.put("mail.smtp.auth", "true");
//		prop.put("mail.smtp.starttls.enable", "true");
//		prop.put("mail.smtp.socketFactory.port", "465");
//		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//		Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		});
//
//		try
//		{
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress("divyeshakabari01@gmail.com"));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));
//			message.setSubject("Registration  message ");
//			message.setContent(msg,"text/html");
//			//message.setText(msg);
//
//			Transport.send(message);
//
//			System.out.println("Done");
//
//		} 
//		catch (MessagingException e)
//		{
//			e.printStackTrace();
//		}
//	}

	private String mail;
	private String msg;
	
	public SendEmail(String mail, String msg)
	{
		this.mail=mail;
		this.msg=msg;
	}
		@Override
		public void run()
		{
			final String username = "divyeshakabari01@gmail.com";
			final String password = "Divyesh1234";

			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", "587");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.socketFactory.port", "465");
			prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			try
			{
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("divyeshakabari01@gmail.com"));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));
				message.setSubject("Registration  message ");
				message.setContent(msg,"text/html");
				message.setText(msg);

				Transport.send(message);

				System.out.println("Done");

			} 
			catch (MessagingException e)
			{
				e.printStackTrace();
			}
		}
}
