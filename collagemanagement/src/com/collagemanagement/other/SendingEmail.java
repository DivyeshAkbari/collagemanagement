package com.collagemanagement.other;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//import com.collagemanagement.encryptpassword.TrippleDes;
//import com.collagemanagement.other.SendingEmail1;

public class SendingEmail implements Runnable
{

	private String userEmail;
	private String myHash;
	private int value;


	//private String Incryptedemail;

	//	TrippleDes td;

	public SendingEmail(String userEmail, String myHash,int value)
	{
		this.userEmail = userEmail;
		this.myHash = myHash;
		this.value=value;
	}
	
	@Override
	public void run() 
	{
		String email = "divyeshakabari01@gmail.com";
		String password = "Divyesh1234";

		Properties theProperties = new Properties();

		theProperties.put("mail.smtp.auth", "true");
		theProperties.put("mail.smtp.starttls.enable", "true");
		theProperties.put("mail.smtp.host", "smtp.gmail.com");
		theProperties.put("mail.smtp.port", "587");

		Session session = Session.getDefaultInstance(theProperties, new javax.mail.Authenticator()
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(email, password);
			}
		});

		try {
			 
			String encrypymail=null;
			if(value==0)
			{
				 encrypymail=Encryption.encode(userEmail);
				System.out.println("THis is correct "+userEmail);
			}
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
			message.setSubject("Email Verification Link");
			
			if(value==0)
			{
				message.setText("Click this link to confirm your email address and complete setup for your account."
					+ "\n\nVerification Link: " + "http://localhost:8081/collagemanagement/ActivateAccount?key1=" + encrypymail + "&key2=" + myHash);
			}
			else
			{
				message.setText("Your Account is verified now you can log in using this link ."
				+ "\n\n " + "http://localhost:8081/collagemanagement/Gointologinpage");
			}
			Transport.send(message);
			
			System.out.println("Successfully sent Verification Link");
		} 
		catch (Exception e)
		{
			System.out.println("Error at SendingEmail.java: " + e);
		}	
	}
}
