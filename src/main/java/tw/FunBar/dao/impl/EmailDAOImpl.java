package tw.FunBar.dao.impl;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Repository;


import tw.FunBar.dao.EmailDAO;



@Repository
public class EmailDAOImpl implements EmailDAO {

	@Override
	public void sendEmail(String email) {
		String host = "smtp.gmail.com";
		  int port = 587;
		  final String username = "funbar109@gmail.com";
		  final String password = "ftnnxuqoxaywfrtt";

		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.port", port);
		  Session session = Session.getInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(username, password);
		   }
		  });

		  try {

		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress("funbar109@gmail.com"));
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		   message.setSubject("訂位資訊.");
		   message.setText("Dear Levin, 感謝您的訂位 !          FunBar .");
		   
		   
//           MimeBodyPart textPart = new MimeBodyPart();
//           StringBuffer html = new StringBuffer();
//           html.append("<h2>這是第一行</h2><br>");
//           html.append("<h3>這是第二行，下面會是圖</h3><br>");
//           html.append("<img style='width:100px;height:100px' src='cid:image'/><br>");
//           textPart.setContent(html.toString(), "text/html; charset=UTF-8");
//
//           // 圖檔部份，注意 html 用 cid:image，則header要設<image>
//           MimeBodyPart picturePart = new MimeBodyPart();
//           FileDataSource fds = new FileDataSource("C:\\FinalProject\\FunBar\\src\\main\\webapp\\WEB-INF\\views\\images\\two-cups.jpg");
//           picturePart.setDataHandler(new DataHandler(fds));
//           picturePart.setFileName(fds.getName());
//           picturePart.setHeader("Content-ID", "<image>");
//
//           Multipart email = new MimeMultipart();
//           email.addBodyPart(textPart);
//           email.addBodyPart(picturePart);
//
//           message.setContent(email);

		   Transport transport = session.getTransport("smtp");
		   transport.connect(host, port, username, password);

		   Transport.send(message);

		   System.out.println("寄送email結束.");

		  } catch (MessagingException e) {
		   throw new RuntimeException(e);
		  }

	}

}
