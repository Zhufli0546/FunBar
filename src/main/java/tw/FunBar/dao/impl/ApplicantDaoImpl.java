package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ApplicantDao;
import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;

@Repository
@SuppressWarnings("unchecked")
public class ApplicantDaoImpl implements ApplicantDao{

	SessionFactory factory;
	
	@Autowired
	public void factory(SessionFactory sessionFactory) {
		this.factory = sessionFactory;
	}
	
	@Override
	public void addApplicant(String applicantName,String gender, 
			String applicantPhone,String applicantEmail) {
		Applicant al = new Applicant();
		al.setApplicantName(applicantName);
		al.setGender(gender);
		al.setApplicantPhone(applicantPhone);
		al.setApplicantEmail(applicantEmail);
		
		Activity ac = new Activity();
		
		al.getActivities().add(ac);
		
		Session session = factory.getCurrentSession();
		session.save(al);
	}

//	@Override
//	public void getAllApplicant(int applicantId) {
//		Applicant applicant = new Applicant();
//		applicant.setApplicantId(applicantId);
//		Session session = factory.getCurrentSession();
//		Applicant al = session.get(Applicant.class, applicantId);
//		al.getActivities();
//		
//	}
	
	@Override
	public List<Applicant> getApplicantsAndActivities(int applicantId) {
		String hql = "select * from ActivityMap as am,Activity as ac"
				+ " where am.activityId = ac.activityId and am.applicantId = :applicantId"; 
		List<Applicant> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
		
	}
	
}
