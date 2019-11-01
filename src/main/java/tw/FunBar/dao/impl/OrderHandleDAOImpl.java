package tw.FunBar.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.OrderHandleDAO;
import tw.FunBar.model.OrderBean;
@Repository
public class OrderHandleDAOImpl implements OrderHandleDAO{
		@Autowired
		SessionFactory sessionFactory;
		
	@Override
	public List<OrderBean> orderSetup() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void tally() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delivery() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void paymentHandle() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addProduct() {
		Session session = sessionFactory.getCurrentSession();
		
		
	}

}
