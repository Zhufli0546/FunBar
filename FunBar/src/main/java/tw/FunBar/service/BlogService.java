package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;

public interface BlogService {
	public void insertBlog(Blog blog);
	public List<Category> getCategories();
	public Category findByIdCategory(int id);
}
