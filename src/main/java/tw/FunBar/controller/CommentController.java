package tw.FunBar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {

	@RequestMapping("/commentInsert")
	public String commentInsert(@RequestParam Integer memberId,
								@RequestParam Integer blogId,
								@RequestParam Integer parentCommentId) {
		
		System.out.println("blogId:" + blogId);
		return "redirect:/blog/" + blogId;
	}
}
