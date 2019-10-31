package tw.FunBar.dao;

import tw.FunBar.model.Member;

public interface MemberDAO {
		
	Member checkMember(String username,String password);

}
