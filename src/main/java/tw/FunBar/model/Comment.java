package tw.FunBar.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int commentId;
	private String commentName;
	private String commentEmail;
	private String commentContent;
	private String commentCreatedTime;
	
	@Transient
	private Integer commentStatus;

	@JsonIgnoreProperties("blog")
	@ManyToOne
	@JoinColumn(name = "BLOGID")
	private Blog blog;

	@OneToMany(mappedBy = "parentComment", cascade = CascadeType.ALL)
	private Set<Comment> replyComment = new LinkedHashSet<Comment>();

	@ManyToOne
	@JoinColumn(name = "PARENTCOMMENTID")
	private Comment parentComment;

	//private Integer memberId;
}
