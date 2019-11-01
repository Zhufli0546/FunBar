package tw.FunBar.dao;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.ProductBean;


public interface OrderHandleDAO {
	void addProduct(ProductBean pb); 
	List <OrderBean> orderSetup(); //成立訂單
	void tally(); //理貨
	void delivery();  //配送
	void paymentHandle();  //付款方式選擇
	ProductBean getProductById(Integer productId);
	
}
