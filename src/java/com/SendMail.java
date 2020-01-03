package com;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMail {
    public void Verify(String give, int code)
   {
      String to = give;
      String from = "sbaalumnis@gmail.com";
      final String username = "sbaalumnis@gmail.com";//change accordingly
      final String password = "Passme!23";//change accordingly

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.port", "587");
         Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
	   // Creates a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Sets From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Sets To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
	
	   // Sets Subject: header field
	   message.setSubject("Verification Code");
	
	   //Sets message of text
            message.setContent("<body><p>This is the verification code. "
                    + "Copy and paste the following into the verification box:"
                    + " </p></body>"+code,"text/html; charset=utf-8");
	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");

      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
   }
    
    public void ForgotPassword(String give, int pwd)
   {
      String to = give;

      // Sender's email ID needs to be mentioned
      String from = "sbaalumnis@gmail.com";
      final String username = "sbaalumnis@gmail.com";//change accordingly
      final String password = "Passme!23";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
	   // Create a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
	
	   // Set Subject: header field
	   message.setSubject("Lost Password");
	
	   // Now set the actual message
	   //message.setText("Hello, this is sample for to check send " +
		//"email using JavaMailAPI ");
            message.setContent("<body><p>Your verification code is: </p></body>"+pwd,"text/html; charset=utf-8");
	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");
           

      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
   }
    
    
    
    public boolean MailContent(String give, String content, String From, String name)
   {
      String to = give;
      boolean sent=false;

      // Sender's email ID needs to be mentioned
      String from = "sbaalumnis@gmail.com";
      final String username = "sbaalumnis@gmail.com";//change accordingly
      final String password = "Passme!23";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
	   // Create a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
	
	   // Set Subject: header field
	   message.setSubject("You have received an email from "+name+" using the SBAalumni site");
	
	   // Now set the actual message
	   //message.setText("Hello, this is sample for to check send " +
		//"email using JavaMailAPI ");
            message.setContent("<body><p>"+content+"</p><br>Sent using SBAalumni<br>My email id is: <strong>"+From+ "</strong> Please use it to contact me</body>","text/html; charset=utf-8");
	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");
           sent=true;
           return sent;
           

      } catch (MessagingException e) {
         throw new RuntimeException(e);
         
      }
   }
    public void AccountCreated(String give)
   {
      String to = give;

      // Sender's email ID needs to be mentioned
      String from = "sbaalumnis@gmail.com";
      final String username = "sbaalumnis@gmail.com";//change accordingly
      final String password = "Passme!23";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
	   // Create a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
	
	   // Set Subject: header field
	   message.setSubject("Account created!");
	
	   // Now set the actual message
	   //message.setText("Hello, this is sample for to check send " +
		//"email using JavaMailAPI ");
            message.setContent("<body><p>Thank you for creating an account in SBA alumni. Get started by checking out our student or alumni members and sending one of them a friendly Email. </p></body>","text/html; charset=utf-8");
	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");
           

      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
   }
    
    public void Notify(String give, String take, String content)
   {
      String to = give;

      // Sender's email ID needs to be mentioned
      String from = "sbaalumnis@gmail.com";
      final String username = "sbaalumnis@gmail.com";//change accordingly
      final String password = "Passme!23";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
	   // Create a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
	
	   // Set Subject: header field
	   message.setSubject(take+" has posted a message");
	
	   // Now set the actual message
	   //message.setText("Hello, this is sample for to check send " +
		//"email using JavaMailAPI ");
            message.setContent(take+" says "+content,"text/html; charset=utf-8");
	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");

      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
   }
    public void change(String give)
   {
      String to = give;

      // Sender's email ID needs to be mentioned
      String from = "sbaalumnis@gmail.com";
      final String username = "sbaalumnis@gmail.com";//change accordingly
      final String password = "Passme!23";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
	   // Create a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
	
	   // Set Subject: header field
	   message.setSubject("Congratulations!");
	
	   // Now set the actual message
	   //message.setText("Hello, this is sample for to check send " +
		//"email using JavaMailAPI ");
            message.setContent("Your request to become an alumni has been accepted","text/html; charset=utf-8");
	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");

      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
   }
    
}
    

