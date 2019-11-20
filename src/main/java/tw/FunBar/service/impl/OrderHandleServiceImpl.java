package tw.FunBar.service.impl;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.OrderHandleDAO;
import tw.FunBar.model.OrderBean;
import tw.FunBar.model.OrderItemBean;
import tw.FunBar.model.ProductBean;
import tw.FunBar.service.OrderHandleService;

@Service
public class OrderHandleServiceImpl implements OrderHandleService{
	@Autowired
	OrderHandleDAO dao;


	@Transactional
	@Override
	public void addProduct(ProductBean pb) {
		dao.addProduct(pb);	
	}

	@Transactional
	@Override
	public ProductBean getProductById(Integer productId) {
		return dao.getProductById(productId);
	}



	@Transactional
	@Override
	public ProductBean deleteProduct(Integer productId) {
		return dao.deleteProduct(productId);		
	}




	@Transactional
	@Override
	public void updateProduct(Integer productId, String productNo,Blob productCover,String productDetail, String productName,
			 String category, Double discount, Integer stock) {
		 dao.updateProduct(productId, productNo,productCover,productDetail, productName, category, discount, stock);
		
	}

	
	@Override
	public void addOrder(OrderBean order) {
		dao.addOrder(order);
		
	}

	@Transactional
	@Override
	public void addOrderItemList(List<OrderItemBean> orderItemList) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	
}
