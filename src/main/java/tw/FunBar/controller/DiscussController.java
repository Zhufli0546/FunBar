package tw.FunBar.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.FunBar.model.Post;
import tw.FunBar.service.DiscussService;

@Controller
public class DiscussController {

	DiscussService service;

	@Autowired
	public void setService(DiscussService service) {
		this.service = service;
	}

	@RequestMapping(value = "/discuss", method = RequestMethod.GET)
	public String discuss(Model model) {
		List<Post> list = service.getAllPostDetail();
		model.addAttribute("title", "討論區");
		model.addAttribute("post", list);
		model.addAttribute("reply", list);
		model.addAttribute("reply2", list);
		model.addAttribute("Post", new Post());
		model.addAttribute("Reply", new Post());
		return "discuss";
	}
	
	 @GetMapping(value = "/discuss.json", produces = "application/json")
	 public @ResponseBody List<Post> allPost(HttpServletResponse response) {
		 List<Post> list = service.getAllPostDetail();
	  System.out.println("Hello~" + list);
	  return list;
	 }
	 
//	 @GetMapping("/discuss") 
//	 public String getCreateNewPost(Model model) {
//	     model.addAttribute("Post", new Post()); 
//	     return "discuss"; 
//	 }
	 
	 @RequestMapping(value = "/discuss", method = RequestMethod.POST)
	 public String processCreatePost(@ModelAttribute("Post") Post post) {
		 service.createPost(post);
		 return "redirect:/discuss";
	 }
	 

}
