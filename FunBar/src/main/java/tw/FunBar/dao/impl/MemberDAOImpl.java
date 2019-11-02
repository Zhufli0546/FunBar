package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.MemberDAO;
import tw.FunBar.model.Alltime;
import tw.FunBar.model.Member;


@Repository
public class MemberDAOImpl implements MemberDAO {
 
 @Autowired
 SessionFactory sessionFactory;
 
 @Override
 public Member checkMember(String username, String password) {
  Session session = sessionFactory.getCurrentSession();
  String hql="From Member m where m.username=:username and m.password=:password";
  Query query = session.createQuery(hql);
  query.setParameter("username",username);
  query.setParameter("password", password);
  
  Member member = (Member) query.getSingleResult();
  
   return member;
 }

}