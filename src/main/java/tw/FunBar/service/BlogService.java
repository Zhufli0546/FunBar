package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;
import tw.FunBar.model.Comment;

public interface BlogService {
	public List<Blog> queryAllBlogs();
	
	public List<Blog> queryAllBlogsByASC();
	
	public Blog findByIdBlog(int id);

	public void insertBlog(Blog blog);

	public List<Category> getCategories();

	public Category findByIdCategory(int id);
	
	public List<Comment> getComments();
}
