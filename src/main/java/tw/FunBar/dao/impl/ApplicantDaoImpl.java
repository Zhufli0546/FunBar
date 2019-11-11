package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	
	//使用者報名活動
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

		al.getActivities().add(ac);

		session.save(al);
	}
	
//	@Override
//	public List<Applicant> QueryActivity(int applicantId){
//		Session session = factory.getCurrentSession();
//		Applicant ac = new Applicant();
//		ac.setApplicantId(applicantId);
//		
//		Applicant app = session.get(Applicant.class, applicantId);
//		System.out.println("app"+app);
//		app.getActivities();
//
//		return null;
//		
//	}
	
	//查詢此活動報名者
	@Override
	public List<Activity> QuerySignupApplicant(int activityId) {
		String sql = "select al.applicantId,al.applicantName,"
				+ "al.gender,al.applicantEmail,al.applicantEmail "
				+ "from ActivityMap as am , Applicant as al " + 
				"where am.applicantId = al.applicantId "
				+ "and am.activityId = :activityId"; 
		
//		String sql = "Select  From ActivityMap am Inner join Activity ac on "
//				+ "ac.activityId = am.activityId"
//				+ " Where ac.activityId =:activityId";
		Session session = factory.getCurrentSession();
//		SQLQuery<Activity> query = session.createSQLQuery(sql);
//		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).setParameter("activityId", activityId);
//		List data = query.list();
		
//		SqlQuery<Activity> query1 = (SqlQuery<Activity>) session.createSQLQuery(sql);
		List<Activity> list = new ArrayList<>();
		list = session.createQuery(sql).setParameter("activityId", activityId).getResultList();
		
		
		return list;
	}
	
	//查詢所有報名者
	@Override
	public List<Applicant> getApplicants() {
		String hql = "FROM Applicant";
		List<Applicant> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	//查詢已報名活動
	@Override
	public List<Applicant> getSignUpApplicants(int applicantId) {
		String hql = "Select * From ActivityMap Inner join Applicant "
				+ "on Applicant.applicantId = ActivityMap.applicantId "
				+"Where Applicant.applicantId  = :applicantId";
		
		List<Applicant> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("applicantId", 12).getResultList();
		return list;
	}
	
	@Override
	public Applicant deleteApplicantById(int applicantId) {
		Session session = factory.getCurrentSession();
		Applicant al = session.get(Applicant.class, 1);
		
		Set<Activity> ac = new HashSet<>();
		ac = null;
		al.setActivities(ac);
		
		session.delete(al);
		return al;
		
	}
	
//	@Override
//	public void deleteMapById(int activityId,int applicantId) {
//		String hql = "delete from ActivityMap where applicantId "
//				+ "= :applicantId and activityId = :activityId";
//		Session session = factory.getCurrentSession();
//		Applicant applicant = session.get(Applicant.class, applicantId);
//		Set<Activity> ac = new HashSet<>();
//		ac = null;
//		applicant.setActivities(ac);
//		
//		Activity activity = session.get(Activity.class, activityId);
//		Set<Applicant> al = new HashSet<>();
//		al = null;
//		activity.setApplicants(al);
//		
//		
//    	session.createSQLQuery(hql).setParameter("activityId", 21)
//    							   .setParameter("applicantId", 3).executeUpdate();
//	}
	
//	@Override
//	public void deleteMapById(int applicantId,int activityId) {
//		Session session = factory.getCurrentSession();
//		Applicant al = session.get(Applicant.class, 2);
//		Activity ac = session.get(Activity.class, 25);
//		al.getActivities().remove(ac);
//		session.delete(ac);
//	}
	
	//查詢中介資料表
	public List<Integer> queryMapById(int activityId, int applicantId) {
		String sql = "Select am.activityId,am.applicantId From "
				+ "Activity at, ActivityMap am, Applicant al"
				+ "Where at.activityId = am.activityId and al.applicantId = am.applicantId"
				+ "and at.activityId = :activityId and al.applicantId = :applicantId";
		
		Session session = factory.getCurrentSession();

		List<Integer> list = new ArrayList<>();
		list = session.createSQLQuery(sql).setParameter("activityId", 21)
				.setParameter("applicantId",12).getResultList();
		
		return list;
	}
	
	public void deleteMapById(int activityId, int applicantId) {
		
	}
	
}
