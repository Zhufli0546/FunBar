package tw.FunBar.dao;

import java.sql.Blob;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.ProductBean;


public interface OrderHandleDAO {
	
	List <OrderBean> orderSetup(); //成立訂單	
	
	ProductBean getProductById(Integer productId);
	
	void addProduct(ProductBean pb); 
	
	ProductBean deleteProduct(Integer productId);


	void updateProduct(Integer productId, String productNo, Blob productCover,String productDetail, String productName, 
			String category, Double discount, Integer stock);

}
