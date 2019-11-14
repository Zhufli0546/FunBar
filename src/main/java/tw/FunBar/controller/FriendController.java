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
		if (member == null) return "redirect:/signin";
		model.addAttribute("title", "好友");
		return "friend";
	}
	
	@RequestMapping(value = "/getAllMemberJson", produces = "application/json")
	public String getAllMemberJson(Model model) {
		List<Member> member = memberService.getAllmembers();
		model.addAttribute("Member", member);
		return "getAllMemberJson";
	}
	



//	@RequestMapping(value = "/discussJson", produces = "application/json")
//	public String discussJson(Model model) {
//		List<Post> postList = service.getAllPostDetail();
//		model.addAttribute("Post", postList);
//		return "discussJson";
//	}
//
//	@RequestMapping(value = "createPost", method = RequestMethod.POST)
//	public String createPost(@RequestParam String postContent,
//							@RequestParam Integer memberId) {
//		Post post = new Post();
//		post.setPostContent(postContent);
//		post.setMemberId(memberId);
//		service.createPost(post);
//		return "redirect:/discuss";
//	}
//
//	@RequestMapping(value = "replyComment", method = RequestMethod.POST)
//	public String replyComment(@RequestParam String postContent, 
//							   @RequestParam Integer parentPostId,
//							   @RequestParam Integer memberId) {
//		Post parentPost = service.findByIdPost(parentPostId);
//		Post post = new Post();
//		post.setPostContent(postContent);
//		post.setParentPostId(parentPost);
//		post.setMemberId(memberId);
//		service.createPost(post);
//		return "redirect:/discuss";
//	}
//
//	@RequestMapping(value = "updateContent", method = RequestMethod.POST)
//	public String updateContent(@RequestParam String postContent, 
//								@RequestParam Integer postId) {
//		Post post = new Post();
//		post.setPostContent(postContent);
//		post.setPostId(postId);
//		service.updatePostContent(post);
//		return "redirect:/discuss";
//	}
//
//	@RequestMapping(value = "deleteContent", method = RequestMethod.GET)
//	public String deleteContent(@RequestParam Integer postId) {
//		service.deletePostContent(postId);
//		return "redirect:/discuss";
//	}
//	
//	@RequestMapping(value = "/likeJson", produces = "application/json")
//	public String likeJson(@RequestParam(value = "memberId") Integer memberId, Model model) {
//		List<LikePost> likeList = service.getLikesById(memberId);
//		model.addAttribute("like", likeList);
//		return "likeJson";
//	}
//
//	@GetMapping(value = "Like")
//	public @ResponseBody long getLikes(@RequestParam(value = "postId") Integer postId) {
//		long count = service.getLikeByPostId(postId);
//		return count;
//	}
//
//	@GetMapping(value = "addLike")
//	public @ResponseBody void addLike(@RequestParam(value = "postId") Integer postId,
//									  @RequestParam(value = "memberId") Integer memberId) {
//		LikePK likepk = new LikePK();
//		likepk.setPostId(postId);
//		likepk.setMemberId(memberId);
//		LikePost like = new LikePost();
//		like.setLikePK(likepk);
//		service.addLike(like);
//	}
//
//	@GetMapping(value = "unLike")
//	public @ResponseBody void unLike(@RequestParam(value = "postId") Integer postId,
//					   				 @RequestParam(value = "memberId") Integer memberId) {
//		LikePK likepk = new LikePK();
//		likepk.setPostId(postId);
//		likepk.setMemberId(memberId);
//		LikePost like = new LikePost();
//		like.setLikePK(likepk);
//		service.unLike(like);
//	}
//
//	@RequestMapping(value = "/admin_discuss", method = RequestMethod.GET)
//	public String admin_discuss(Model model) {
//		model.addAttribute("title", "討論區");
//		return "admin_discuss";
//	}
//
//
//	@RequestMapping(value = "/memberJson", produces = "application/json")
//	public String memberJson(@RequestParam(value = "memberName") String memberName, Model model) {
//		List<Member> member = service.searchMember(memberName);
//		model.addAttribute("member", member);
//		return "memberJson";
//	}
//
//	@GetMapping(value = "sendFriendRequest")
//	public void sendFriendRequest(@RequestParam(value = "memberId") Integer memberId,
//								  @RequestParam(value = "memberIdf") Integer memberIdf) {
//		Friendship friendship = new Friendship();
//		friendship.setSender_memberId(memberId);
//		friendship.setReceiver_memberId(memberIdf);
//		service.sendFriendRequest(friendship);
//	}
//	
//	@GetMapping(value = "confirmFriendRequest")
//	public void confirmFriendRequest(@RequestParam(value = "memberId") Integer memberId,
//								     @RequestParam(value = "memberIdf") Integer memberIdf) {
//		Friendship friendshipStatus = new Friendship();
//		friendshipStatus.setSender_memberId(memberId);
//		friendshipStatus.setReceiver_memberId(memberIdf);
//		friendshipStatus.setFriendStatus(2);
//		service.confirmFriendRequest(friendshipStatus);
//		Friendship friendshipInsert = new Friendship();
//		friendshipInsert.setSender_memberId(memberIdf);
//		friendshipInsert.setReceiver_memberId(memberId);
//		friendshipInsert.setFriendStatus(2);
//		service.sendFriendRequest(friendshipInsert);
//	}
//	
//	@RequestMapping(value = "/friendJson", produces = "application/json")
//	public void friendJson(Model model) {
//		List<Friendship> friendList = service.getAllFriendRequest();
//		model.addAttribute("friend", friendList);
//	}

}