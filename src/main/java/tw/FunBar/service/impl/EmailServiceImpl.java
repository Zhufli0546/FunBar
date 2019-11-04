package tw.FunBar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.EmailDAO;
import tw.FunBar.service.EmailService;


@Service
@Transactional
public class EmailServiceImpl implements EmailService {
	
	
	@Autowired
	EmailDAO emailDAO;
	
	@Override
	public void sendEmail(String email) {
		emailDAO.sendEmail(email);

	}

}
