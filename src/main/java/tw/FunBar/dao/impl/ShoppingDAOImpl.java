package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ShoppingDAO;
import tw.FunBar.model.ProductBean;

@Repository
public class ShoppingDAOImpl implements ShoppingDAO{
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	

	@Override
	public List<ProductBean> getAllProducts() {
		String hql = "From ProductBean";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<String> getAllCategories() {
		String hql = "Select Distict category from ProductBean";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}


	@Override
	public List<ProductBean> getProductByCategory(String category) {
		String hql = "From ProductBean WHERE category = :category";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("category", category).getResultList();
		return list;
	}
	

}
