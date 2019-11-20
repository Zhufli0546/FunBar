package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ShoppingDAO;
import tw.FunBar.model.ProductBean;

@Repository
public class ShoppingDAOImpl implements ShoppingDAO{
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> showNewProducts() {   //首頁顯示最新上架三筆商品
		String hql = "From ProductBean where stock !=0 order by productId desc";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setFirstResult(0).setMaxResults(3).getResultList();
		return list;
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {        //前台購物區介面，只顯示有庫存的商品     
		String hql = "From ProductBean Where stock !=0 ";    
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllproducts1() {   //後台管理顯示所有商品
		String hql = "From ProductBean";   
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategories() {
		String hql = "Select Distinct category From ProductBean";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list  = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductByCategory(String category) {
		String hql = "From ProductBean Where category = :category And stock != 0 ";
		Session session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("category",category).getResultList();
		
		for(ProductBean p:list) {
			System.out.println("ProductBean:" + p.getCategory());
			System.out.println("ProductBean:" + p.getProductName());
		}
		return list;
	}




	

}
