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
	
//	@RequestMapping("/applicantSignup")
//	public String addApplicant(@RequestParam(name="applicantName") String applicantName,
//			@RequestParam(name="gender") String gender,
//			@RequestParam(name="applicantPhone") String applicantPhone,
//			@RequestParam(name="applicantEmail") String applicantEmail,
//			@RequestParam(name="activityId") Integer activityId,Model model) {
//		
//		service.addApplicant(applicantName, gender, applicantPhone, applicantEmail, activityId);
//		model.addAttribute(activityId);
//		return "activities";
//		
//	}
	
	@RequestMapping("/applicantSignup")
	public String addApplicant(@RequestParam(name="applicantName") String applicantName,
			@RequestParam(name="gender") String gender,
			@RequestParam(name="applicantPhone") String applicantPhone,
			@RequestParam(name="applicantEmail") String applicantEmail
			) {
		
		service.addApplicant(applicantName, gender, applicantPhone, applicantEmail);
		return "activities";
		
	}



//	@RequestMapping("")
//	public String getApplicants(@RequestParam("id") Integer applicantId, Model model) {
//		List<Applicant> al = service.getApplicantsAndActivities(applicantId);		
//		model.addAttribute("al",al);
//		return "activityRegistration";
//		
//	}
}
