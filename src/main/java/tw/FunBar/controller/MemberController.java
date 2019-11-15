package tw.FunBar.controller;



import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import tw.FunBar.model.Member;
import tw.FunBar.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	ServletContext context;
	// 一般登入
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signIn() {

		return "signin";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signinto(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd,
			Model model, HttpServletRequest request, HttpSession session) {
		
		Member member = null;
		try {
			member = memberService.signin(memberId, memberPwd);
		} catch(NoResultException e) {
			return "redirect:/signin";
		}
		

		int level = member.getMemberLevel();
		System.out.println("level:"+level);
		
		if (member != null && level == 0) {
			session = request.getSession(false);
			session.setAttribute("member", member);
			return "redirect:/";
		}

		if (member != null && level > 1) {
			return "redirect:/admin";
		} else {
			
			return "signin";
		}
	}

	// 登出
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {

		session = request.getSession(false);
		session.removeAttribute("member");
		// 結束妳要去的頁面
		return "redirect:/";
	}

// 查詢單筆
	@RequestMapping("/getONE1")
	public String getONE1(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("one", memberService.getONEmember(id));

		return "getONE1";
	}
	// 查詢全部
	@RequestMapping("/showAllmember")
	public String list(Model model) {

		List<Member> list = memberService.getAllmembers();
		model.addAttribute("members", list);
		return "showAllmember";
	}
	// 新增
	// 這個是對照到jsp的action
	@RequestMapping(value = "/joinus", method = RequestMethod.GET)
	public String savemember(Model model) {
		Member mb = new Member();
		model.addAttribute("Member", mb);
		return "joinus";
	}
	@RequestMapping(value = "/joinus", method = RequestMethod.POST)
	public String dosavemember(@ModelAttribute("Member") Member mb, HttpServletRequest request, HttpSession session) {
		
		Member member = null;
		
		
		
		MultipartFile IMG = mb.getMemberimg();
		String originalFilename = IMG.getOriginalFilename();
		mb.setMemberfileName(originalFilename);
		if (IMG != null && !IMG.isEmpty() ) {
			try {
				byte[] b = IMG.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setMemberPic(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		memberService.saveMember(mb);
		session =request.getSession(false);
		session.setAttribute("member", mb);
		
		
		
		return "redirect:/showAllmember";
		
	}
	// 刪除
	@RequestMapping("/deletemb")
	public String deletemb(@RequestParam("id") Integer id) {
		System.out.println("id=" + id);
		memberService.delete(id);
		// model.addAttribute("mb",memberService.delete(id));
		return "redirect:/showAllmember";

	}

	// 修改
	@RequestMapping(value = "/getONE", method = RequestMethod.GET)
	public String getONE(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("one", memberService.getONEmember(id));
		return "getONE";
	}
	@RequestMapping(value = "/updatemb", method = RequestMethod.POST)
	public String updatemb(@RequestParam Integer id, @RequestParam("memberName") String memberName,
			@RequestParam("memberAddress") String memberAddress, @RequestParam("memberBirth") String memberBirth,
			@RequestParam("memberPhone") String memberPhone, @RequestParam("memberPwd") String memberPwd,
			@RequestParam("memberId") String memberId, @RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberimg") MultipartFile memberimg,Model model) throws Exception {
		System.out.println("Id=" + id);
		byte[] b1 = memberimg.getBytes();
		Blob blob = new SerialBlob(b1);
		memberService.updateMember(id, memberName, memberAddress, memberBirth, memberPhone, memberPwd, memberId,
				memberEmail, blob);
		return "redirect:/showAllmember";
	}
	//讀取圖片資料
	@RequestMapping(value = "/membergetPicture/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp,@PathVariable Integer id){
	byte[] media = null;
	  HttpHeaders headers = new HttpHeaders();
	  String memberfileName = "";
	  int len = 0;
	  Member mm = memberService.getONEmember(id);
	  if (mm != null) {
	   Blob memberPic = mm.getMemberPic();
	   memberfileName = mm.getMemberfileName();
	   if (mm != null) {
	    try {
	     len = (int) memberPic.length();
	     media = memberPic.getBytes(1, len);
	    } catch (SQLException e) {
	     e.printStackTrace();
	    }
	   }
	  }
	  ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media,HttpStatus.OK);
	  return responseEntity;
	}
	
	
	// 修改自己
		@RequestMapping(value = "/getself", method = RequestMethod.GET)
		public String getself(@RequestParam("id") Integer id, Model model) {
			model.addAttribute("one", memberService.getONEmember(id));
			return "getself";
		}
		@RequestMapping(value = "/updatemb1", method = RequestMethod.POST)
		public String updatemb1(@RequestParam Integer id, @RequestParam("memberName") String memberName,
				@RequestParam("memberAddress") String memberAddress, @RequestParam("memberBirth") String memberBirth,
				@RequestParam("memberPhone") String memberPhone, @RequestParam("memberPwd") String memberPwd,
				@RequestParam("memberId") String memberId, @RequestParam("memberEmail") String memberEmail,
				@RequestParam("memberimg") MultipartFile memberimg,Model model) throws Exception {
			System.out.println("Id=" + id);
			byte[] b1 = memberimg.getBytes();
			Blob blob = new SerialBlob(b1);
			memberService.updateMember(id, memberName, memberAddress, memberBirth, memberPhone, memberPwd, memberId,
					memberEmail, blob);
			return "redirect:/showMAN";
		}
	
	
}