package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;

public interface ApplicantDao {
	
	//public void addApplicant(String applicantName,String gender, String applicantPhone,String applicantEmail, int activityId);
	
	public List<Applicant> getApplicantsAndActivities(int applicantId);

	void addApplicant(String applicantName, String gender, String applicantPhone, String applicantEmail);
}
