package tw.FunBar.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Friendship")
public class Friendship implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer memberId;
	private Integer memberIdf;
	private String startDate;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getMemberIdf() {
		return memberIdf;
	}

	public void setMemberIdf(Integer memberIdf) {
		this.memberIdf = memberIdf;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

}
