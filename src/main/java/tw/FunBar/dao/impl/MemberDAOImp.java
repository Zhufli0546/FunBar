package tw.FunBar.dao.impl;


import java.sql.Blob;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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

	// 修改
	@Override
	public void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId,Integer memberLevel, String memberEmail, Blob blob) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Member SET memberName =:memberName," + "memberAddress =:memberAddress,"
				+ "memberBirth =:memberBirth," + "memberPhone =:memberPhone," + "memberPwd =:memberPwd,"
				+ "memberId =:memberId," + "memberEmail =:memberEmail,"+ "memberLevel =:memberLevel," + "memberPic =:memberPic WHERE id =:id";

		session.createQuery(hql).setParameter("id", id).setParameter("memberName", memberName)
				.setParameter("memberAddress", memberAddress).setParameter("memberBirth", memberBirth)
				.setParameter("memberPhone", memberPhone).setParameter("memberPwd", memberPwd)
				.setParameter("memberId", memberId).setParameter("memberEmail", memberEmail)
				.setParameter("memberLevel", memberLevel)
				.setParameter("memberPic", blob).executeUpdate();

	}
	//修改密碼
	@Override
	public void newPwd(String memberId, String memberPwd) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Member SET memberPwd =:memberPwd WHERE memberId =:memberId";
		
		session.createQuery(hql).setParameter("memberPwd", memberPwd)
								.setParameter("memberId", memberId).executeUpdate();
	}
	
	

//	一般會員打完登入資料，進入這個方法
	@Override
	public Member signin(String memberId, String memberPwd) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Member WHERE memberId = :memberId and memberPwd = :memberPwd";

		Member member = (Member)session.createQuery(hql)
							.setParameter("memberId", memberId)
							.setParameter("memberPwd", memberPwd).getSingleResult();
		return member;
	}

	
	
	
	//沒屁用
	@Override
	public Member checkuser(String memberId, String memberPwd) {
		Member mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM Member WHERE memberId = :memberId and memberPwd = :memberPwd";
		try {
			mb = (Member) session.createQuery(hql).setParameter("memberId", memberId)
					.setParameter("memberPwd", memberPwd).uniqueResult();
		} catch (NoResultException ex) {
			mb = null;
		}
		return mb;
	}
	// 查詢單筆
	@Override
	public Member getONEmember(int id) {
		Session session = factory.getCurrentSession();
		Member mb = session.get(Member.class, id);

		return mb;

	}
	//會員自己查自己
	@Override
	public Member showMan(int id) {
		Session session = factory.getCurrentSession();
		Member mb = session.get(Member.class, id);
		return mb;
	}


	//找自己
	@Override
	public void updateself(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			 String memberEmail, Blob blob) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Member SET memberName =:memberName," + "memberAddress =:memberAddress,"
				+ "memberBirth =:memberBirth," + "memberPhone =:memberPhone," + 
				  "memberEmail =:memberEmail," + "memberPic =:memberPic WHERE id =:id";

		session.createQuery(hql).setParameter("id", id).setParameter("memberName", memberName)
				.setParameter("memberAddress", memberAddress).setParameter("memberBirth", memberBirth)
				.setParameter("memberPhone", memberPhone)
			.setParameter("memberEmail", memberEmail)
				.setParameter("memberPic", blob).executeUpdate();

	}


	//驗證
	@Override
	public void levelup(int memberLevel,int id) {
		Session session = factory.getCurrentSession();
		String hql ="UPDATE Member SET memberLevel =:memberLevel WHERE id =:id";
		session.createQuery(hql).setParameter("id", id).setParameter("memberLevel", 1).executeUpdate();
		
	}
	
	@Override
	public Member forget(String memberId) {
		Session session = factory.getCurrentSession();
		
		String hql = "FROM Member WHERE memberId =:memberId";
		Member mb=(Member) session.createQuery(hql).setParameter("memberId", memberId).getSingleResult();
		return mb;
		

		
	}



	@Override
	public void stateup(int memberLevel) {
		Session session = factory.getCurrentSession();
		
		
	}
	



	




	
	
	
	
}
