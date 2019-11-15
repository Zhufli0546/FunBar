package tw.FunBar.dao;


import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import tw.FunBar.model.Member;

public interface MemberDAO {
	List<Member> getAllmembers();

	Member getONEmember(int id);
	
	Member showMan(int id);

	void saveMember(Member mb);

	void delete(int id);

	void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId, String memberEmail,Blob blob);

	void updateself(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			String memberPwd, String memberId, String memberEmail,Blob blob);
	
	Member signin (String memberId,String memberPwd);
	
	
	//沒屁用
	Member  checkuser (String memberId,String memberPwd);
	
	
}