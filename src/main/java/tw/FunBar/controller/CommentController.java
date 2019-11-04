package tw.FunBar.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Comment;
import tw.FunBar.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;

	@RequestMapping("/commentInsert")
	public String commentInsert(@RequestParam Integer memberId,
								@RequestParam Integer blogId,
								@RequestParam Integer parentCommentId,
								@RequestParam String commentContent) {
		
		//未來整合 Member

		Blog blog = commentService.findByBlogId(blogId);

		Comment parentComment = null;
		if(parentCommentId == -1) {
			parentComment = null;
		} else {
			parentComment = commentService.findByCommentId(parentCommentId);
		}
		
		Comment comment = new Comment();
		comment.setCommentName("allen");
		comment.setCommentEmail("allen@gmail.com.tw");
		comment.setCommentContent(commentContent);
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createdTime = sdf.format(d);
		comment.setCommentCreatedTime(createdTime);

		comment.setBlog(blog);
		comment.setParentComment(parentComment);
		
		commentService.insertComment(comment);
		return "redirect:/blog/" + blogId;
	}
}
