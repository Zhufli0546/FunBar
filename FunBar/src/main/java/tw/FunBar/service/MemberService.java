package tw.FunBar.service;

import tw.FunBar.model.Member;

public interface MemberService {
		
	Member checkMember(String username,String password);

}