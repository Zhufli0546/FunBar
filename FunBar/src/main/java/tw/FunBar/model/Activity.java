package tw.FunBar.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Activity")
public class Activity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int activityId;
	private String eventName;
	private String eventDate;
	private String address;
	private String introduction;
	private String activities;
	private String information;
	private Blob picture;
	private String fileName;
	private String eventCreateTime;
	
	@Transient
	private MultipartFile activityImage;
	
	public MultipartFile getActivityImage() {
		return activityImage;
	}

	public void setActivityImage(MultipartFile activityImage) {
		this.activityImage = activityImage;
	}
	
//	@Transient
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="FK_EventCategory_categoryId") 	
//	private EventCategory eventCategory;
//	
//	
//	public EventCategory getEventCategory() {
//		return eventCategory;
//	}
//	public void setEventCategory(EventCategory eventCategory) {
//		this.eventCategory = eventCategory;
//	}
	public int getActivityId() {
		return activityId;
	}
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	
	public String getActivities() {
		return activities;
	}
	public void setActivities(String activities) {
		this.activities = activities;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public Blob getPicture() {
		return picture;
	}
	public void setPicture(Blob picture) {
		this.picture = picture;
	}
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getEventCreateTime() {
		return eventCreateTime;
	}
	public void setEventCreateTime(String eventCreateTime) {
		this.eventCreateTime = eventCreateTime;
	}
	
}
