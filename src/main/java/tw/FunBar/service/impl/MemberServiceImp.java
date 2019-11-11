package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.MemberDAO;
import tw.FunBar.model.Member;
import tw.FunBar.service.MemberService;
@Service
@Transactional
public class MemberServiceImp implements MemberService {
	
	MemberDAO dao;

	@Autowired
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<Member> getAllmembers() {
		 
		return dao.getAllmembers();
	}	
	
	@Override
	public Member getONEmember(int id) {
		
		return dao.getONEmember(id);
	}

	@Override
	public void saveMember(Member mb) {
		dao.saveMember(mb);
		
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

	@Override
	public void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId, String memberEmail) {
		dao.updateMember(id, memberName, memberAddress, memberBirth, memberPhone, memberPwd, memberId, memberEmail);
		
	}

	@Override
	public Boolean signin(String memberId, String memberPwd) {
		
		return dao.signin(memberId, memberPwd);
	}

	



	

	

	

	

}
