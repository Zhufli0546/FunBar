package tw.FunBar.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.Suggestion;
import tw.FunBar.service.ActivityService;
import tw.FunBar.service.ApplicantService;
import tw.FunBar.service.EmailService;

@Controller
public class ApplicantController {
	
	ApplicantService service;
	

	@Autowired
	public void setService(ApplicantService service) {
		this.service = service;
	}
	
	//使用者報名活動
	@RequestMapping("/applicantSignup")
	public String addApplicant(
			@RequestParam(name="applicantName") String applicantName,
			@RequestParam(name="gender") String gender,
			@RequestParam(name="applicantPhone") String applicantPhone,
			@RequestParam(name="applicantEmail") String applicantEmail,
			@RequestParam(name="activityId") Integer activityId,
			@RequestParam(name="memberId") String memberId,
			Model model) {
		
		service.addApplicant(applicantName, gender, applicantPhone, applicantEmail, activityId,memberId);
		model.addAttribute(activityId);
	
			return "signupSuccess";
	}

	//查詢活動報名者
	@RequestMapping(value="/getActivities" ,method=RequestMethod.GET)
	public String getActivities(
			@RequestParam(name="activityId") Integer activityId,
			Model model) {
		
		Set<Applicant> al = service.QuerySignupApplicant(activityId);
		model.addAttribute("al",al);
		
		return "allApplicants";
	}
	
	//查詢已報名活動
	@RequestMapping(value="/getsiqnupActivity/{memberId}" ,method=RequestMethod.GET)
	public String getsiqnupActivity(@PathVariable String memberId,Model model) {
		
		Set<Activity> activity = service.QuerySignActivity(memberId);
		model.addAttribute("activity", activity);
		
		return "applicantSignup";
	}

	//取消報名
	@RequestMapping("/cancelSignup/{memberId}&{activityId}")
	public String cancelSignup(@PathVariable(value = "activityId") Integer activityId,
							   @PathVariable(value = "memberId") String memberId) {
		service.deleteMap(memberId, activityId);
		return "cancelSignupSuccess";
	}
	
	//----------------------------------------------------------------
	
	@RequestMapping(value = "/addSuggestion", method = RequestMethod.GET)
	public String input(Model model) {
		model.addAttribute("suggestion", new Suggestion());
		return "addSuggestion";
	}

	@RequestMapping(value = "/addSuggestion", method = RequestMethod.POST)
	public String addSuggestion(Suggestion suggestion) {
		service.addSuggestion(suggestion);
		return "addSuggestion";
	}
		
	@RequestMapping(value="/allSuggestion",method = RequestMethod.GET)
	public String showAllSuggestion(Model model) {
		List<Suggestion> su = service.getAllSuggestion();
		model.addAttribute("su", su);
		
		return "allSuggestion";
		
	}
	
	
}
