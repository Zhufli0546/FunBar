package tw.FunBar.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.model.Member;
import tw.FunBar.service.MemberService;

@Controller
public class MemberController {
 
 @Autowired
 MemberService memberService;
 
 
 @RequestMapping("/signin")
 public String signIn() {
  return "signin" ;
 }
 
 @RequestMapping(value="/check",method=RequestMethod.POST)
 public String check(@RequestParam(name="username") String username,
      @RequestParam(name="password") String password,
      Model model,HttpServletRequest request) {
  Member member = memberService.checkMember(username, password);
  
  if(member != null) {
   HttpSession session = request.getSession();
   session.setAttribute("user",member);
   model.addAttribute("Member", member);
   return "redirect:/";
  }else {
   return "index";
  }
 }
 
 @RequestMapping("/logout")
 public String logout(HttpServletRequest request) {
  HttpSession session = request.getSession();
  session.removeAttribute("user");
  return "index";
 }
}