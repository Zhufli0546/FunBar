package tw.FunBar.dao;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.ProductBean;


public interface OrderHandleDAO {
	
	List <OrderBean> orderSetup(); //成立訂單	
	
	ProductBean getProductById(Integer productId);
	
	void addProduct(ProductBean pb); 
	
	void deleteProduct(ProductBean pb);

//	void updateProduct(int prodId, double discount, int stock);
	
	void updateProduct(ProductBean pb);

}
