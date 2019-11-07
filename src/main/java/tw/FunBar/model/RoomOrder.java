package tw.FunBar.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="RoomOrder")
public class RoomOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_id;
	
	//private Integer member_id;
	
	private Integer room_id;
	
	private String check_in_time;
	
	private String check_out_time;
	
	private Integer rooms;
	
	private Integer people;
	
	private String driving;
	
	private String remark;
	
	
	@ManyToOne
	@JoinColumn(name="ROOM_ID")
	private Room room;


	public Integer getOrder_id() {
		return order_id;
	}


	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}


	public Integer getRoom_id() {
		return room_id;
	}


	public void setRoom_id(Integer room_id) {
		this.room_id = room_id;
	}


	public String getCheck_in_time() {
		return check_in_time;
	}


	public void setCheck_in_time(String check_in_time) {
		this.check_in_time = check_in_time;
	}


	public String getCheck_out_time() {
		return check_out_time;
	}


	public void setCheck_out_time(String check_out_time) {
		this.check_out_time = check_out_time;
	}
	
	


	public Integer getRooms() {
		return rooms;
	}


	public void setRooms(Integer rooms) {
		this.rooms = rooms;
	}


	public Integer getPeople() {
		return people;
	}


	public void setPeople(Integer people) {
		this.people = people;
	}





	public String getDriving() {
		return driving;
	}


	public void setDriving(String driving) {
		this.driving = driving;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Room getRoom() {
		return room;
	}


	public void setRoom(Room room) {
		this.room = room;
	}
	
	
	
	
}
