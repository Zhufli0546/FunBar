package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;

public interface ApplicantDao {
	
	public void addApplicant(String applicantName,String gender, String applicantPhone,
			String applicantEmail, int activityId);

	public List<Activity> QuerySignupApplicant(int activityId);
	
	public Applicant deleteApplicantById(int applicantId);
	
	public void deleteMapById(int activityId,int applicantId);
	
	public List<Integer> queryMapById(int activityId, int applicantId);
	
	public List<Applicant> getApplicants();
	
	public List<Applicant> getSignUpApplicants(int applicantId);
}
