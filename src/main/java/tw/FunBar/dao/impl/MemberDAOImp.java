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

	// 查詢全部
	@Override
	public List<Member> getAllmembers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Member";
		List<Member> list = session.createQuery(hql).getResultList();

		return list;
	}

	// 查詢單筆
	@Override
	public Member getONEmember(int id) {
		Session session = factory.getCurrentSession();
		Member mb = session.get(Member.class, id);

		return mb;

	}

	// 新增
	@Override
	public void saveMember(Member mb) {
		Session session = factory.getCurrentSession();
		session.save(mb);

	}

	// 刪除
	@Override
	public void delete(int id) {
		System.out.println("id2=" + id);
		Session session = factory.getCurrentSession();
		Member mb = session.get(Member.class, id);
		session.delete(mb);

	}
	//修改
	@Override
	public void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId, String memberEmail) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Member SET memberName =:memberName," + "memberAddress =:memberAddress,"
				+ "memberBirth =:memberBirth," + "memberPhone =:memberPhone," + "memberPwd =:memberPwd,"
				+ "memberId =:memberId," + "memberEmail =:memberEmail WHERE id =:id";

		session.createQuery(hql).setParameter("id", id).setParameter("memberName", memberName)
				.setParameter("memberAddress", memberAddress).setParameter("memberBirth", memberBirth)
				.setParameter("memberPhone", memberPhone).setParameter("memberPwd", memberPwd)
				.setParameter("memberId", memberId).setParameter("memberEmail", memberEmail).executeUpdate();

	}
	
	
	
	
	//打完登入資料，進入這個方法
	@Override
	public Boolean signin(String memberId, String memberPwd) {
		Member mb;
		Session session = factory.getCurrentSession();
		String hql = "FROM Member WHERE memberId = :memberId and memberPwd = :memberPwd";
		
			mb =(Member)session.createQuery(hql)
					.setParameter("memberId",memberId)
					.setParameter("memberPwd",memberPwd)
					.getSingleResult();
			if(mb!=null) {
				return true;
			}else {
				return false;
			}
			
		
	}

	

}
