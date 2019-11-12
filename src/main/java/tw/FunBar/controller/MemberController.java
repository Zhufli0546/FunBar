package tw.FunBar.controller;

import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
// @RequestMapping(value="/check",method=RequestMethod.POST)
// public String check(@RequestParam(name="memberName") String memberName,
//      @RequestParam(name="memberPwd") String memberPwd,
//      Model model,HttpServletRequest request) {
//  Member member = memberService.checkMember(memberName, memberPwd);
//  
//  if(member != null) {
//   HttpSession session = request.getSession();
//   session.setAttribute("user",member);
//   model.addAttribute("Member", member);
//   //不知道
//   return "redirect:/";
//  }else {
//   return "index";
//  }
// }

	// 一般登入
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signIn() {

		return "signin";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signinto(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd,
			Model model, HttpServletRequest request, HttpSession session) {

		Member member = memberService.signin(memberId, memberPwd);

		int level = member.getMemberLevel();
		if (member != null && level == 1) {
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

	// 管理員登入
//		@RequestMapping(value = "/signin", method = RequestMethod.GET)
//		public String allen() {
//
//			return "signin";
//		}
//	

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
	public String dosavemember(@ModelAttribute("Member") Member mb) {
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
			@RequestParam("memberPic") String memberPic, @RequestParam("memberLevel") int memberLevel,
			Model model) {
		System.out.println("Id=" + id);
		memberService.updateMember(id, memberName, memberAddress, memberBirth, memberPhone, memberPwd, memberId,
				memberEmail, memberPic, memberLevel);
		return "redirect:/showAllmember";
	}
}
