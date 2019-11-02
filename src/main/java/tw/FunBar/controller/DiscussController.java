package tw.FunBar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.FunBar.model.Like;
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
		List<Post> postList = service.getAllPostDetail();
//		List<Like> listLike = service.getAllLike();
		model.addAttribute("title", "°Q½×°Ï");
		model.addAttribute("post", postList);
		model.addAttribute("reply", postList);
		model.addAttribute("reply2", postList);
		model.addAttribute("Post", new Post());
		model.addAttribute("Reply", new Post());
//		model.addAttribute("like",listLike);
		return "discuss";
	}
	
//	 @GetMapping(value = "/discuss.json", produces = "application/json")
//	 public @ResponseBody List<Post> allPost(HttpServletResponse response) {
//		 List<Post> list = service.getAllPostDetail();
//	  System.out.println("Hello~" + list);
//	  return list;
//	 }
	 
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
	 
//	 @RequestMapping(value = "/discuss", method = RequestMethod.POST)
//	 public String createLike(@ModelAttribute("Like") Like like) {
//		 service.createLike(like);
//		 return "redirect:/discuss";
//	 }
	 

}
