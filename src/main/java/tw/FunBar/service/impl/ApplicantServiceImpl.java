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
	public void addApplicant(String applicantName,String gender, String applicantPhone,String applicantEmail) {
		dao.addApplicant(applicantName, gender, applicantPhone, applicantEmail);
		
	}

	@Transactional
	@Override
	public List<Applicant> getApplicantsAndActivities(int applicantId) {
		return dao.getApplicantsAndActivities(applicantId);
	}
	
}
