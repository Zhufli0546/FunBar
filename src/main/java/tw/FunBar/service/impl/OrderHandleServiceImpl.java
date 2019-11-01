package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.OrderHandleDAO;
import tw.FunBar.model.OrderBean;
import tw.FunBar.service.OrderHandleService;

@Service
public class OrderHandleServiceImpl implements OrderHandleService{
	@Autowired
	OrderHandleDAO dao;

	@Transactional
	@Override
	public List<OrderBean> orderSetup() {
		return dao.orderSetup() ;
	}

	@Transactional
	@Override
	public void tally() {
		dao.tally();
		
	}

	@Transactional
	@Override
	public void delivery() {
		dao.delivery();
		
	}

	@Transactional
	@Override
	public void paymentHandle() {
		dao.paymentHandle();
		
	}
	
}
