package tw.FunBar.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.BlogDAO;
import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;
import tw.FunBar.model.Comment;

@Repository
public class BlogDAOImpl implements BlogDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void insertBlog(Blog blog) {
		Session session = sessionFactory.getCurrentSession();
		session.save(blog);
	}

	@Override
	public List<Category> getCategories() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Category";
		List<Category> categoryList = (List<Category>)session.createQuery(hql).getResultList();
		return categoryList;
	}

	@Override
	public Category findByIdCategory(int id) {
		Session session = sessionFactory.getCurrentSession();
		Category category = session.get(Category.class, id);
		return category;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Blog> queryAllBlogs() {
		String hql = "From Blog Order By blogCreatedTime DESC";
		Session session = sessionFactory.getCurrentSession();
		List<Blog> blogs = (List<Blog>)session.createQuery(hql).getResultList();
		return blogs;
	}

	@Override
	public Blog findByIdBlog(int id) {
		Session session = sessionFactory.getCurrentSession();
		Blog blog = session.get(Blog.class, id);
		return blog;
	}

	@Override
	public List<Comment> getComments() {
		String hql = "From Comment";
		Session session = sessionFactory.getCurrentSession();
		List<Comment> comments = (List<Comment>)session.createQuery(hql).getResultList();
		return comments;
	}

	@Override
	public List<Blog> queryAllBlogsByASC() {
		String hql = "From Blog Order By blogCreatedTime ASC";
		Session session = sessionFactory.getCurrentSession();
		List<Blog> blogs = (List<Blog>)session.createQuery(hql).getResultList();
		return blogs;
	}

}
