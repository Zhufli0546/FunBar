package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tw.FunBar.dao.OrderHandleDAO;
import tw.FunBar.model.OrderBean;
import tw.FunBar.model.ProductBean;


@Repository
public class OrderHandleDAOImpl implements OrderHandleDAO{
		@Autowired
		SessionFactory sessionFactory;
		
	@Override
	public List<OrderBean> orderSetup() {
		return null;
	}
	
	
	@Override
	public void addProduct(ProductBean pb) {
//		System.out.println("name:" + pb.getFileName());
		Session session = sessionFactory.getCurrentSession();
		session.save(pb);
	
	}
	
	@Override
	public ProductBean getProductById(Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, productId);
		return pb;
	}


//	@Override
//	public void updateProduct(int prodId, double discount, int stock) {
//		String hql = "Update ProductBean Set discount= :discount,stock= :stock Where productId= :productId";
//		Session session = sessionFactory.getCurrentSession();
//		int n = session.createQuery(hql)
//				.setParameter("discount", discount)
//				.setParameter("stok", stock)
//				.setParameter("productId", prodId)
//				.executeUpdate();
//	}
//	
	
	@Override
	public void updateProduct(ProductBean pb) {
		String hql = "Update ProductBean Set productName= :productName, productDetail= :productDetail,category= :category, discount= :discount, Where productId= :productId";
		Session session = sessionFactory.getCurrentSession();
		session.update(pb);
	}

	

	@Override
	public void deleteProduct(ProductBean pb) {
		String hql = "Delete From ProductBean where productId = :productId";
		Session session = sessionFactory.getCurrentSession();
		session.delete(pb);
		
	}

	

}
