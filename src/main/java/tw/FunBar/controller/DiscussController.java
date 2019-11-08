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

import tw.FunBar.model.Blog;
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
		model.addAttribute("title", "討論區");
		model.addAttribute("post", postList);
		return "discuss";
	}

	@RequestMapping(value = "/discussJson", produces = "application/json")
	public String discussJson(Model model) {
		List<Post> postList = service.getAllPostDetail();
		model.addAttribute("Post", postList);
		return "discussJson";
	}

	@RequestMapping(value = "createPost", method = RequestMethod.POST)
	public String createPost(@RequestParam String postContent) {
		Post post = new Post();
		post.setPostContent(postContent);
		service.createPost(post);
		return "redirect:/discuss";
	}

	@RequestMapping(value = "replyComment", method = RequestMethod.POST)
	public String replyComment(@RequestParam String postContent, @RequestParam Integer parentPostId) {
		Post parentPost = service.findByIdPost(parentPostId);
		Post post = new Post();
		post.setPostContent(postContent);
		post.setParentPostId(parentPost);
		service.createPost(post);
		return "redirect:/discuss";
	}

	@RequestMapping(value = "updateContent", method = RequestMethod.POST)
	public String updateContent(@RequestParam String postContent, @RequestParam Integer postId) {
		Post post = new Post();
		post.setPostContent(postContent);
		post.setPostId(postId);
		service.updatePostContent(post);
		return "redirect:/discuss";
	}
	
	@RequestMapping(value = "deleteContent", method = RequestMethod.GET)
	public String deleteContent(@RequestParam Integer postId) {
		service.deletePostContent(postId);
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
		like.setLikePK(likepk);
		service.addLike(like);
	}

	@GetMapping(value = "unLike")
	public @ResponseBody void unLike(@RequestParam(value = "postId") Integer postId,
			@RequestParam(value = "memberId") Integer memberId) {
		LikePK likepk = new LikePK();
		likepk.setPostId(postId);
		likepk.setMemberId(memberId);
		LikePost like = new LikePost();
		like.setLikePK(likepk);
		service.unLike(like);
	}

}
