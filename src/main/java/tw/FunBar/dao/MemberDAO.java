package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Member;

public interface MemberDAO {
	List<Member> getAllmembers();

	Member getONEmember(int id);

	void saveMember(Member mb);

	void delete(int id);

	void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId, String memberEmail);

	Boolean  signin (String memberId,String memberPwd);
}