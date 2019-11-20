package tw.FunBar.service;

import java.sql.Blob;
import java.util.List;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.OrderItemBean;
import tw.FunBar.model.ProductBean;

public interface OrderHandleService {
	
	public ProductBean getProductById(Integer productId);
	
	void addProduct(ProductBean pb);
		
	ProductBean deleteProduct(Integer productId);

	void updateProduct(Integer productId,String productNo,Blob productCover,String productDetail,String productName, 
			String category, Double discount,Integer stock);
	
	public int addOrder(OrderItemBean ob) ;

	public void addOrderItemList(List<OrderItemBean> orderItemList);

	public void addOrder(OrderBean order);

}
