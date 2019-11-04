package tw.FunBar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.FunBar.model.LikePK;
import tw.FunBar.model.LikePost;
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
		model.addAttribute("title", "討論區");
		model.addAttribute("post", postList);
		model.addAttribute("reply", postList);
		model.addAttribute("reply2", postList);
		model.addAttribute("Post", new Post());
		model.addAttribute("Reply", new Post());
//		model.addAttribute("like",listLike);
		return "discuss";
	}
	
	@RequestMapping(value = "/discuss", method = RequestMethod.POST)
	public String processCreatePost(@ModelAttribute("Post") Post post) {
		service.createPost(post);
		return "redirect:/discuss";
	}
	
	@GetMapping(value = "Like")
	public @ResponseBody long getLikes(@RequestParam(value = "postId") Integer postId) {
		long count = service.getLikeByPostId(postId);
		return count;
	}

	@GetMapping(value = "addLike")
	public @ResponseBody void addLike(@RequestParam(value = "postId") Integer postId,
			@RequestParam(value = "memberId") Integer memberId) {
		LikePK likepk = new LikePK();
		likepk.setPostId(postId);
		likepk.setMemberId(memberId);
		LikePost like = new LikePost();
		like.setLikePK(likepk);;
		service.addLike(like);
	}
	
	@GetMapping(value = "unLike")
	public @ResponseBody void unLike(@RequestParam(value = "postId") Integer postId,
			@RequestParam(value = "memberId") Integer memberId) {
		LikePK likepk = new LikePK();
		likepk.setPostId(postId);
		likepk.setMemberId(memberId);
		LikePost like = new LikePost();
		like.setLikePK(likepk);;
		service.unLike(like);
	}

//	 @GetMapping("/discuss") 
//	 public String getCreateNewPost(Model model) {
//	     model.addAttribute("Post", new Post()); 
//	     return "discuss"; 
//	 }



//	 @RequestMapping(value = "/discuss", method = RequestMethod.POST)
//	 public String createLike(@ModelAttribute("Like") Like like) {
//		 service.createLike(like);
//		 return "redirect:/discuss";
//	 }

}
