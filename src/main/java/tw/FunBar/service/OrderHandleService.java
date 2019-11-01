package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.ProductBean;

public interface OrderHandleService {
	List <OrderBean> orderSetup(); //成立訂單
	void addProduct(ProductBean pb);
	public ProductBean getProductById(Integer productId);

}
