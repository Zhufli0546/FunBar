package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Applicant;

public interface ApplicantService {
	
	public void addApplicant(String applicantName,String gender, String applicantPhone,
			String applicantEmail, int activityId);
	
	public List<Applicant> getApplicantsAndActivities(int applicantId);
}
