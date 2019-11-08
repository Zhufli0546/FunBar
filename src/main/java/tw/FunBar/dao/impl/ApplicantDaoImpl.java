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
			String applicantPhone,String applicantEmail,int activityId) {
		Applicant al = new Applicant();
		al.setApplicantName(applicantName);
		al.setGender(gender);
		al.setApplicantPhone(applicantPhone);
		al.setApplicantEmail(applicantEmail);
		
		Session session = factory.getCurrentSession();
		Activity ac = session.get(Activity.class, activityId);
//		ac.setActivityId(activityId);
//		ac.setEventName(eventName);
//		ac.setEventDate(eventDate);
//		ac.setAddress(address);
//		ac.setIntroduction(introduction);
//		ac.setActivities(activities);
//		ac.setInformation(information);
//		ac.setCategory(category);
//		ac.setFileName(fileName);
		
//		try {
//			byte[] b = ac.getActivityImage().getBytes();
//			blob = new SerialBlob(b);
//			ac.setPicture(blob);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		al.getActivities().add(ac);

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
