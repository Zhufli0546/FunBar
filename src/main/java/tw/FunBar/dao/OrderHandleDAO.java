package tw.FunBar.dao;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import tw.FunBar.model.OrderBean;


public interface OrderHandleDAO {
	void addProduct(); 
	List <OrderBean> orderSetup(); //成立訂單
	void tally(); //理貨
	void delivery();  //配送
	void paymentHandle();  //付款方式選擇
	
}
