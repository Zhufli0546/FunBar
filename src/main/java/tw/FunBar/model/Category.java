package tw.FunBar.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer categoryId;
	private String categoryName;

	@OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
	private Set<Blog> blogs = new LinkedHashSet<Blog>();

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Set<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(Set<Blog> blogs) {
		this.blogs = blogs;
	}

}
