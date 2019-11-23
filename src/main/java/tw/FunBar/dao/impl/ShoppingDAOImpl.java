package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ShoppingDAO;
import tw.FunBar.model.Activity;
import tw.FunBar.model.ProductBean;

@Repository
public class ShoppingDAOImpl implements ShoppingDAO{

	@Autowired
	SessionFactory factory;
	
		
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> showNewProducts() {   //FunBar首頁顯示最新上架三筆商品
		String hql = "From ProductBean where stock !=0 And status=0 order by productId desc";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setFirstResult(0).setMaxResults(10).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductByPage(int index) {    //Mall分頁
		String hql = "FROM ProductBean Where stock!=0 And status=0 ";
		Session session = null;
		session = factory.getCurrentSession();
		List<ProductBean> list;
		list = (List<ProductBean>)session.createQuery(hql).setFirstResult((index-1)*15).setMaxResults(15).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getIndex() {           //Mall取得分頁數
		String hql = "From ProductBean";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		
		int listCount = list.size()/15;
		listCount= listCount+1;
		return listCount;
	}

	

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllproducts1(int index) {   //後台管理顯示所有商品
		String hql = "From ProductBean";   
		Session session = null;
		session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();		
		list = session.createQuery(hql).setFirstResult((index-1)*15).setMaxResults(15).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getProdIndex1() {      			 //後台管理商品取得分頁數
		String hql = "From ProductBean order by productId ASC";
		Session session = null;
		session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		
		int listCount = list.size()/15;
		
		if(list.size()%15==0) {
			return listCount;
		}else {
			listCount= listCount+1;
			return listCount;
			
		}
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
	public List<ProductBean> getProductByCategory(String category, Integer index) {     //Category分頁
		String hql = "From ProductBean Where category = :category And stock != 0 And status=0";
		Session session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("category",category).setFirstResult((index-1)*15).setMaxResults(15).getResultList();
		
		for(ProductBean p:list) {
			System.out.println("ProductBean:" + p.getCategory());
			System.out.println("ProductBean:" + p.getProductName());
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getCategoryIndex(String category) {           //Category取得分頁數
		String hql = "From ProductBean Where category = :category";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("category",category).getResultList();
		
		int listCount = list.size()/15;
		
		if(list.size()%15==0) {
			return listCount;
		}else {
			listCount= listCount+1;
			return listCount;
			
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {        //前台Mall介面，只顯示有庫存的商品     
		String hql = "From ProductBean Where stock !=0 And status=0";    
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	

	
	




	

}
