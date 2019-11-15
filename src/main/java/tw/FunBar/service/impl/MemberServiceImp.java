package tw.FunBar.service.impl;

import java.sql.Blob;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
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
	public void saveMember(Member mb) {
		dao.saveMember(mb);
		
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

	@Override
	public void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId, String memberEmail,Blob blob) {
		dao.updateMember(id, memberName, memberAddress, memberBirth, memberPhone, memberPwd, memberId, memberEmail, blob);
	}

	@Override
	public void updateself(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId, String memberEmail,Blob blob) {
		dao.updateMember(id, memberName, memberAddress, memberBirth, memberPhone, memberPwd, memberId, memberEmail, blob);
	}
	
	
	@Override
	public Member signin(String memberId, String memberPwd) {
		
		return dao.signin(memberId, memberPwd);
	}

	@Override
	public Member checkuser(String memberId, String memberPwd) {
		
		return dao.checkuser(memberId, memberPwd);
	}

	@Override
	public Member showMan(int id) {
		
		return dao.showMan(id);
	}
	@Override
	public Member getONEmember(int id) {
		
		return dao.getONEmember(id);
	}


	



	

	

	

	

}
