package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.OrderBean;

public interface OrderHandleService {
	List <OrderBean> orderSetup(); //成立訂單
	void tally(); //理貨
	void delivery();  //配送
	void paymentHandle();  //付款方式選擇

}
