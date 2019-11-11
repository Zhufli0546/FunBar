package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Member;

public interface MemberService {
	List<Member> getAllmembers();

	void saveMember(Member mb);

	Member getONEmember(int id);

	void delete(int id);

	void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId, String memberEmail,String memberPic,int memberLevel);
	
	Member signin (String memberId,String memberPwd);

	Member checkuser (String memberId,String memberPwd);
}
