package tw.FunBar.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.MemberDAO;
import tw.FunBar.model.Member;
import tw.FunBar.service.MemberService;
@Service
public class MemberServiceImp implements MemberService {
	
	MemberDAO dao;
	@Autowired
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public List<Member> getAllmembers() {
		 
		return dao.getAllmembers();
	}


	public MemberDAO getDao() {
		return dao;
	}

	

}
