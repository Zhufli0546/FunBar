package tw.FunBar.dao.impl;

import java.sql.Blob;
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



	@Override
	public ProductBean deleteProduct(Integer productId) {
//		String hql = "Delete From ProductBean where productId = :productId";
		Session session = sessionFactory.getCurrentSession();	
		ProductBean pb = session.get(ProductBean.class,productId);
		session.delete(pb);
		return pb;
		
	}




	@Override
	public void updateProduct(Integer productId, String productNo,Blob productCover, String productDetail,String productName,
			 String category, Double discount, Integer stock) {
		
		System.out.print(productDetail);
		String hql = "Update ProductBean Set productName= :productName, productDetail= :productDetail,productImage= :productImage ,category= :category, discount= :discount,stock= :stock,productNo = :productNo Where productId= :id";
		Session session = sessionFactory.getCurrentSession();
		session.createQuery(hql)	
				.setParameter("productName", productName)
				.setParameter("productDetail", productDetail)
				.setParameter("productImage", productCover)
				.setParameter("category", category)	
				.setParameter("discount", discount)
				.setParameter("stock", stock)
				.setParameter("productNo",productNo)
				.setParameter("id", productId)
				.executeUpdate();	
		
	}


	

	

}
