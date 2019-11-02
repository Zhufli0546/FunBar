package tw.FunBar.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.BlogDAO;
import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;

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

}
