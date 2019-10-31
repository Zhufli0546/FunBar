package tw.FunBar.service.impl;

import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import tw.FunBar.dao.BookingDAO;
import tw.FunBar.model.Alltime;
import tw.FunBar.service.BookingService;


@Service
@Transactional
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	BookingDAO bookingDAO;
	
	
	@Override
	public ArrayList<Alltime> pullTime() {
		return bookingDAO.pullTime();
	}


	@Override
	public ArrayList<Alltime> okTime(String date, Integer people) {
		return bookingDAO.okTime(date, people);
	}





}
