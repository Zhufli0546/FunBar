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
import javax.sound.sampled.AudioFormat.Encoding;

import org.springframework.stereotype.Repository;


import tw.FunBar.dao.EmailDAO;
import tw.FunBar.model.BookingData;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;



@Repository
public class EmailDAOImpl implements EmailDAO {

	@Override
	public void sendEmail(RoomOrder room_order,Room room) {
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
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(room_order.getOrder_email()));
		   message.setSubject("FunBar. 訂房通知");
		   
		   String htmlCode = "";
		   htmlCode += "<div style='margin:0 auto;border:2px solid #02DF82;width:500px;text-align:center;font-size:22px;border-radius:10px'>";
		   htmlCode += "<h1>您的訂房資訊 :</h1>";
		   htmlCode += "<table style='border:none;text-align:ceneter;margin:0 auto'>";
		   htmlCode += "<tr><td>訂房編號:</td><td>"+room_order.getOrder_id()+"</td></tr>";
		   htmlCode += "<tr><td>訂房人姓名:</td><td>"+room_order.getOrder_name()+"</td></tr>";
		   htmlCode += "<tr><td>您的房型:</td><td>"+room.getRoom_type()+"</td></tr>";
		   htmlCode += "<tr><td>入住日期:</td><td>"+room_order.getCheck_in_time()+"</td></tr>";
		   htmlCode += "<tr><td>退房日期:</td><td>"+room_order.getCheck_out_time()+"</td></tr>";
		   htmlCode += "</table><h2 style='color:blue'>FunBar 感謝您的預訂</h2></div>";
		   message.setContent(htmlCode,"text/html;charset=UTF-8");
		   
		   
//           MimeBodyPart textPart = new MimeBodyPart();
//           StringBuffer html = new StringBuffer();
//           html.append("<h2>�o�O�Ĥ@��</h2><br>");
//           html.append("<h3>�o�O�ĤG��A�U���|�O��</h3><br>");
//           html.append("<img style='width:100px;height:100px' src='cid:image'/><br>");
//           textPart.setContent(html.toString(), "text/html; charset=UTF-8");
//
//           // ���ɳ����A�`�N html �� cid:image�A�hheader�n�]<image>
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

		   

		  } catch (MessagingException e) {
		   throw new RuntimeException(e);
		  }

	}

	@Override
	public void sendBookingEmail(BookingData data) {
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
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(data.getEmail()));
		   message.setSubject("FunBar. 訂房通知");
		   
		   String htmlCode = "";
		   htmlCode += "<div style='margin:0 auto;border:2px solid #02DF82;width:500px;text-align:center;font-size:22px;border-radius:10px'>";
		   htmlCode += "<h1>您的訂位資訊 :</h1>";
		   htmlCode += "<table style='border:none;text-align:ceneter;margin:0 auto'>";
		   htmlCode += "<tr><td>訂位編號:</td><td>"+data.getBooking_id()+"</td></tr>";
		   htmlCode += "<tr><td>訂位人姓名:</td><td>"+data.getName()+"</td></tr>";
		   htmlCode += "<tr><td>訂位日期:</td><td>"+data.getDate()+"</td></tr>";
		   htmlCode += "<tr><td>訂位時段:</td><td>"+data.getTime()+"</td></tr>";
		   htmlCode += "<tr><td>訂位人數:</td><td>"+data.getPeople()+"人</td></tr>";
		   htmlCode += "</table><h2 style='color:blue'>FunBar 感謝您的預訂</h2></div>";
		   message.setContent(htmlCode,"text/html;charset=UTF-8");
		   
		   
//         MimeBodyPart textPart = new MimeBodyPart();
//         StringBuffer html = new StringBuffer();
//         html.append("<h2>�o�O�Ĥ@��</h2><br>");
//         html.append("<h3>�o�O�ĤG��A�U���|�O��</h3><br>");
//         html.append("<img style='width:100px;height:100px' src='cid:image'/><br>");
//         textPart.setContent(html.toString(), "text/html; charset=UTF-8");
//
//         // ���ɳ����A�`�N html �� cid:image�A�hheader�n�]<image>
//         MimeBodyPart picturePart = new MimeBodyPart();
//         FileDataSource fds = new FileDataSource("C:\\FinalProject\\FunBar\\src\\main\\webapp\\WEB-INF\\views\\images\\two-cups.jpg");
//         picturePart.setDataHandler(new DataHandler(fds));
//         picturePart.setFileName(fds.getName());
//         picturePart.setHeader("Content-ID", "<image>");
//
//         Multipart email = new MimeMultipart();
//         email.addBodyPart(textPart);
//         email.addBodyPart(picturePart);
//
//         message.setContent(email);

		   Transport transport = session.getTransport("smtp");
		   transport.connect(host, port, username, password);

		   Transport.send(message);

		   

		  } catch (MessagingException e) {
		   throw new RuntimeException(e);
		  }
		
	}

}
