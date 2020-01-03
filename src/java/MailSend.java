
import com.SendMail;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
   public static void main(String[] args) {
      // Recipient's email ID needs to be mentioned.
      
      SendMail mail=new SendMail();
      //mail.sendVerify("aniket28@outlook.com", "123");
      
   }
}