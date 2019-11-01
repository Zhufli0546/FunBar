package tw.FunBar.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class Blog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer blogId;
	private String blogImage;
	private String blogTitle;
	private String blogContent;
	
	@Transient
	private Integer blogIsHot;
	private Date blogCreatedTime;
	
	@ManyToOne
	@JoinColumn(name = "CATEGORYID")
	private Category category;

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

	public String getBlogImage() {
		return blogImage;
	}

	public void setBlogImage(String blogImage) {
		this.blogImage = blogImage;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public String getBlogContent() {
		return blogContent;
	}

	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}

	public Integer getBlogIsHot() {
		return blogIsHot;
	}

	public void setBlogIsHot(Integer blogIsHot) {
		this.blogIsHot = blogIsHot;
	}

	public Date getBlogCreatedTime() {
		return blogCreatedTime;
	}

	public void setBlogCreatedTime(Date blogCreatedTime) {
		this.blogCreatedTime = blogCreatedTime;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}
