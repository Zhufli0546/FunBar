package tw.FunBar.dao.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tw.FunBar.dao.OrderHandleDAO;
import tw.FunBar.model.OrderBean;
import tw.FunBar.model.OrderItemBean;
import tw.FunBar.model.ProductBean;


@Repository
public class OrderHandleDAOImpl implements OrderHandleDAO{
		@Autowired
		SessionFactory sessionFactory;

	
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


	@Override
	public void addOrder(OrderBean order) {		
		Session session = sessionFactory.getCurrentSession();
			
		Double total = 0.0 ;
		for(OrderItemBean orderItem:order.getOrderItem()) {
			
			Integer id = orderItem.getProductId(); //取得賣出的商品id		
			Integer num = orderItem.getQuantity(); //取得數量		
			ProductBean product = session.get(ProductBean.class, id); //		
			Integer stock = product.getStock();	
			product.setStock(stock-num); // 		
			session.update(product);
			
			
			total += orderItem.getSubTotal();
			
			orderItem.setOb(order);
			
		}
			
		   order.setTotalAmount(total);		
		   session.save(order);
				
}


}
