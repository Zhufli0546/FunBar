package tw.FunBar.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.model.Comment;
import tw.FunBar.model.Member;
import tw.FunBar.model.Report;
import tw.FunBar.service.MemberService;
import tw.FunBar.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/reportInsert")
	public String reportInsert(@RequestParam Integer commentId,
							   @RequestParam String reportContent,
							   @RequestParam Integer reportMemberId) {
		
		Report report = new Report();
		
		// 未來判斷是否有 Session 於 Session 取得檢舉人的 reportMemberId
		Member member = memberService.getONEmember(reportMemberId);
		report.setReportName(member.getMemberName());
		report.setReportContent(reportContent);

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String reportCreatedTime = sdf.format(d);
		report.setReportCreatedTime(reportCreatedTime);
		
		// 檢舉人的 memberId
		report.setReportMemberId(reportMemberId);
		
		// 被檢舉人的評論 commentId && 被檢舉人的留言者 commentReportName
		Comment comment = reportService.findCommentById(commentId);
		report.setComment(comment);
		report.setCommentReportName(comment.getCommentName());
		
		return "reportInsert";
	}
}
