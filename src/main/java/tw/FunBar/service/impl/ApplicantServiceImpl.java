package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.ApplicantDao;
import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.service.ApplicantService;

@Service
public class ApplicantServiceImpl implements ApplicantService {

	ApplicantDao dao;
	
	@Autowired
	public void setDao(ApplicantDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public void addApplicant(String applicantName,String gender, String applicantPhone,
			String applicantEmail, int activityId) {
		dao.addApplicant(applicantName, gender, applicantPhone, applicantEmail, activityId);
	}
		

	@Transactional
	@Override
	public List<Activity> QuerySignupApplicant(int activityId) {
		return dao.QuerySignupApplicant(activityId);
	}

	@Transactional
	@Override
	public Applicant deleteApplicantById(int applicantId) {
		return dao.deleteApplicantById(applicantId);
	}

	@Transactional
	@Override
	public void deleteMapById(int activityId, int applicantId) {
		dao.deleteMapById(activityId, applicantId);
		
	}
	
	@Transactional
	@Override
	public List<Integer> queryMapById(int activityId, int applicantId){
		return dao.queryMapById(activityId, applicantId);
	}
	
	@Transactional
	@Override
	public List<Applicant> getApplicants(){
		return dao.getApplicants();
	}

	@Transactional
	@Override
	public List<Applicant> getSignUpApplicants(int applicantId) {
		return dao.getSignUpApplicants(applicantId);
	}
	
	
	
}
