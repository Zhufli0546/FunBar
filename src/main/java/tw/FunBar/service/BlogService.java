package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;

public interface BlogService {
	public List<Blog> queryAllBlogs();
	
	public Blog findByIdBlog(int id);

	public void insertBlog(Blog blog);

	public List<Category> getCategories();

	public Category findByIdCategory(int id);
}
