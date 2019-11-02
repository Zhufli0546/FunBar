package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ActivityDao;
import tw.FunBar.model.Activity;
import tw.FunBar.model.EventCategory;


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
	
//	@Override
//	public List<String> getAllCategories() {
//		String hql = "SELECT DISTINCT a.category FROM Activity a";
//		List<String> list = new ArrayList<>();
//		Session session = factory.getCurrentSession();
//		list = session.createQuery(hql).getResultList();
//		return list;
//	}
//	
//	@Override
//	public List<Activity> getActivityByCategory(String category) {
//		String hql = "FROM Activity ac WHERE ac.catgoryId = :category";
//		List<Activity> list = new ArrayList<>();
//		Session session = factory.getCurrentSession();
//		list = session.createQuery(hql).setParameter("category", category).getResultList();
//		return list;
//	}

//
//	@Override
//	public EventCategory getCategoryById(int categoryId) {
//		Session session = factory.getCurrentSession();
//		EventCategory ec = session.get(EventCategory.class, categoryId);
//		return ec;
//	}
//
//	@Override
//	public List<EventCategory> getCategoryList() {
//		String hql = "FROM EventCategory";
//		List<EventCategory> list = new ArrayList<>();
//		Session session = factory.getCurrentSession();
//		list = session.createQuery(hql).getResultList();
//		return list;
//	}


}
