package tw.FunBar.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.MemberDAO;
import tw.FunBar.model.Member;
@Repository
public class MemberDAOImp implements MemberDAO {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Member> getAllmembers() {
		Session session = factory.getCurrentSession();
		String hql ="FROM Member";
		List<Member> list = session.createQuery(hql).getResultList();
		
		return list;
	}

}
