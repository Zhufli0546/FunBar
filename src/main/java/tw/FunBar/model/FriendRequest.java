package tw.FunBar.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FriendRequest")
public class FriendRequest implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer sender_memberId;
	private Integer receiver_memberId;
	private String requestTime;
	private Integer requestStatus;

	public Integer getSender_memberId() {
		return sender_memberId;
	}

	public void setSender_memberId(Integer sender_memberId) {
		this.sender_memberId = sender_memberId;
	}

	public Integer getReceiver_memberId() {
		return receiver_memberId;
	}

	public void setReceiver_memberId(Integer receiver_memberId) {
		this.receiver_memberId = receiver_memberId;
	}

	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}

	public Integer getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(Integer requestStatus) {
		this.requestStatus = requestStatus;
	}

}
