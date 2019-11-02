package tw.FunBar.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.MemberDAO;

import tw.FunBar.model.Member;
import tw.FunBar.service.MemberService;


@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public Member checkMember(String username, String password) {
		return  memberDAO.checkMember(username, password);
		
	}
}
