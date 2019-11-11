package tw.FunBar.dao.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ActivityDao;
import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;


@Repository
@SuppressWarnings("unchecked")
public class ActivityDaoImpl implements ActivityDao {
	SessionFactory factory;
	
	@Autowired
	public void factory(SessionFactory sessionFactory) {
		this.factory = sessionFactory;
	}
	
	@Override
	public List<Activity> getAllActivities() {
		String hql = "FROM Activity";
		List<Activity> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public Activity getActivity(int activityId) {
		Session session = factory.getCurrentSession();
		Activity ac = session.get(Activity.class, activityId);
		return ac;
	}
	
	@Override
	public void addActivity(Activity activity) {
		Session session = factory.getCurrentSession();
		session.save(activity);
	}
	
	@Override
	public List<String> getAllActivityCategories() {
		String hql = "SELECT DISTINCT a.category FROM Activity a";
		List<String> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public List<Activity> getActivityByCategory(String category) {
		String hql = "FROM Activity ac WHERE ac.category = :category";
		List<Activity> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("category", category).getResultList();
		return list;
	}

	@Override
	public void updateActivity(int activityId, String eventName, String eventDate, String address, String introduction,
			String activities, String information, String category, Blob blob ) {
		String hql = "UPDATE Activity SET eventName =:eventName, eventDate =:eventDate, address =:address,"
				+ " introduction =:introduction, activities =:activities, information =:information,"
				+ " category=:category, picture=:activityImage WHERE activityId = :activityId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("activityId", activityId)
		.setParameter("eventName", eventName).setParameter("eventDate", eventDate)
		.setParameter("address", address).setParameter("introduction", introduction)
		.setParameter("activities", activities).setParameter("information", information)
		.setParameter("category", category).setParameter("activityImage", blob)
		.executeUpdate();
	}
	
	@Override
	public Activity deleteActivityById(int activityId) {
		Session session = factory.getCurrentSession();	
		Activity ac = session.get(Activity.class,activityId);
		Set<Applicant> al = new HashSet<>();
		al = null;
		ac.setApplicants(al);
		
		session.delete(ac);
		return ac;
		
//	@Override
//	public void updateActivity(int activityId, String eventName) {
//		String hql = "UPDATE Activity SET eventName =:eventName WHERE activityId = :activityId";
//		Session session = factory.getCurrentSession();
//		session.createQuery(hql).setParameter("eventName", eventName)
//		.setParameter("activityId", activityId).executeUpdate();
//	}
	
//	@Override
//	public void updateActivity(Activity activity) {
//		Session session = factory.getCurrentSession();
//		session.update(activity);
//	}
	
	}




}
