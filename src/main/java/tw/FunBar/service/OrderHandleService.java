package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.ProductBean;

public interface OrderHandleService {
	List <OrderBean> orderSetup(); //成立訂單
	
	public ProductBean getProductById(Integer productId);
	
	void addProduct(ProductBean pb);
	
//	void updateProduct(int prodId, double discount, int stock);
	
	void updateProduct(ProductBean pb);
	
	void deleteProduct(ProductBean pb);

}
