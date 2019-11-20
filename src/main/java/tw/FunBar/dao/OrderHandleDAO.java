package tw.FunBar.dao;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.OrderItemBean;
import tw.FunBar.model.ProductBean;


public interface OrderHandleDAO {
	
	ProductBean getProductById(Integer productId);
	
	void addProduct(ProductBean pb); 
	
	ProductBean deleteProduct(Integer productId);

	void updateProduct(Integer productId, String productNo,Blob productCover,String productDetail, String productName, 
			String category, Double discount, Integer stock);

	int addOrder(OrderBean order);

	OrderBean getOrderById(int od);

	ArrayList<OrderBean> getMyOrders(Integer memberId,HttpServletRequest req);
}
