package tw.FunBar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.model.Applicant;
import tw.FunBar.service.ApplicantService;

@Controller
public class ApplicantController {
	
	ApplicantService service;
	
	@Autowired
	public void setService(ApplicantService service) {
		this.service = service;
	}
	
	//使用者報名活動
	@RequestMapping("/applicantSignup")
	public String addApplicant(@RequestParam(name="applicantName") String applicantName,
			@RequestParam(name="gender") String gender,
			@RequestParam(name="applicantPhone") String applicantPhone,
			@RequestParam(name="applicantEmail") String applicantEmail,
			@RequestParam(name="activityId") Integer activityId,
			Model model) {
		
		service.addApplicant(applicantName, gender, applicantPhone, applicantEmail, activityId);
	
		model.addAttribute(activityId);
		return "signupSuccess";
	}

	//查詢活動報名者
	@RequestMapping("/getActivities")
	public String getActivities(@RequestParam(name="activityId",required=true) Integer activityId,Model model) {
		service.QuerySignupApplicant(activityId);
		List<Applicant> al = service.getApplicants();
		model.addAttribute("al",al);
		
		return "allApplicants";
	}
	
	//取消報名
	@RequestMapping("/cancelSignup")
	public String cancelSignup(@RequestParam("id") Integer activityId, Model model) {
		model.addAttribute("ac", service.deleteApplicantById(1));
		return "redirect:/activities";
	}
	
	//查詢中介資料表
	@RequestMapping("/queryMapById")
	public String queryMapById(@RequestParam(name="activityId") Integer activityId,
			@RequestParam(name="applicantId") Integer applicantId) {
		service.queryMapById(activityId, applicantId);
		
		return "activities";
	}
	
	
	@RequestMapping("/deleteMap")
	public String deleteMap(@RequestParam(name="activityId") Integer activityId,
			@RequestParam(name="applicantId") Integer applicantId) {
		service.deleteMapById(activityId, applicantId);
		
		return "redirect:/activities";
	}
	
	
	
}
