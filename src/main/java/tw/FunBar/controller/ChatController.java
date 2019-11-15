package tw.FunBar.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

import tw.FunBar.chat.ParticipantRepository;
import tw.FunBar.model.Member;
import tw.FunBar.model.Message;

@Controller
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ParticipantRepository participantRepository;
	private SimpMessagingTemplate messagingTemplate;
	
	@Autowired
	public void setMessagingTemplate(SimpMessagingTemplate messagingTemplate) {
		this.messagingTemplate = messagingTemplate;
	}

	private static final String SUBSCRIBE_MESSAGE_URI = "/topic/chat/message";

	@Autowired
	public void setParticipantRepository(ParticipantRepository participantRepository) {
		this.participantRepository = participantRepository;
	}

	@RequestMapping(value = "/chat", method = RequestMethod.GET)
    public String loginIntoChatRoom(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		participantRepository.add(String.valueOf(member.getId()), member);
		System.out.println(member);
		model.addAttribute("member",member);
        return "chat";
    }

    /**
     * 返回当前在线人数 * @return
     */
    @SubscribeMapping("/chat/participants")
    public Long getActiveUserNumber() {
        return Long.valueOf(participantRepository.getActiveSessions().values().size());
    }

    @MessageMapping("/chat/message")
    public void receiveMessage(Message message) {
        message.setSendDate(new Date());
        message.setMessageType("text");
        logger.info(message.getSendDate() + "," + message.getUserName() + " send a message:" + message.getContent());
        messagingTemplate.convertAndSend(SUBSCRIBE_MESSAGE_URI, message);
    }
    

}
