package tw.FunBar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.FunBar.model.Member;
import tw.FunBar.service.MemberService;

@Controller
public class FriendController {

	MemberService memberService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/friend", method = RequestMethod.GET)
	public String friend(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		System.out.println(member);
		if (member == null)
			return "redirect:/signin";
		model.addAttribute("title", "好友");
		return "friend";
	}

	@RequestMapping(value = "/getAllMemberJson", produces = "application/json")
	public String getAllMemberJson(Model model) {
		List<Member> member = memberService.getAllmembers();
		model.addAttribute("Member", member);
		return "getAllMemberJson";
	}

}
