package tw.FunBar.service;

import java.sql.Blob;
import java.util.List;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.ProductBean;

public interface OrderHandleService {
	List <OrderBean> orderSetup(); //成立訂單
	
	public ProductBean getProductById(Integer productId);
	
	void addProduct(ProductBean pb);
		
	ProductBean deleteProduct(Integer productId);

	void updateProduct(Integer productId,String productNo, Blob productImage,String productDetail,String productName, 
			String category, Double discount,Integer stock);
	

}
