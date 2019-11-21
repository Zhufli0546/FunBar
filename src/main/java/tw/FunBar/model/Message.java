package tw.FunBar.model;

import java.util.Date;

public class Message {

	private Integer senderMemberId;
	private Integer receiverMemberId;
	private String userName;
	private Date sendDate; 
	private String content; 
	private String messageType;

	public Integer getSenderMemberId() {
		return senderMemberId;
	}

	public void setSenderMemberId(Integer senderMemberId) {
		this.senderMemberId = senderMemberId;
	}

	public Integer getReceiverMemberId() {
		return receiverMemberId;
	}

	public void setReceiverMemberId(Integer receiverMemberId) {
		this.receiverMemberId = receiverMemberId;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Message{" + "userName='" + userName + '\'' + ", sendDate=" + sendDate + ", content='" + content + '\''
				+ ", messageType='" + messageType + '\'' + '}';
	}
}
