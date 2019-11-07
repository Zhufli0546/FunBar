package tw.FunBar.service.impl;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.ActivityDao;
import tw.FunBar.model.Activity;
import tw.FunBar.service.ActivityService;

@Service
public class ActivityServiceImpl implements ActivityService {

	ActivityDao dao;

	@Autowired
	public void setDao(ActivityDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public List<Activity> getAllActivities() {
		return dao.getAllActivities();
	}

	@Transactional
	@Override
	public Activity getActivity(int activityId) {
		return dao.getActivity(activityId);
	}

	@Transactional
	@Override
	public void addActivity(Activity activity) {
		dao.addActivity(activity);
	}

	@Transactional
	@Override
	public List<String> getAllActivityCategories() {
		return dao.getAllActivityCategories();
	}

	@Transactional
	@Override
	public List<Activity> getActivityByCategory(String category) {
		return dao.getActivityByCategory(category);
	}

//	@Transactional
//	@Override
//	public void updateActivity(Activity activity) {
//		dao.updateActivity(activity);
//	}
	
//	@Transactional
//	@Override
//	public void updateActivity(int activityId, String eventName) {
//		dao.updateActivity(activityId, eventName);
//	}

	@Transactional
	@Override
	public void updateActivity(int activityId, String eventName, String eventDate, String address, String introduction,
			String activities, String information, String category, Blob blob ) {
		dao.updateActivity(activityId, eventName, eventDate, address, introduction, activities, information, category, blob);
	}
	
	@Transactional
	@Override
	public Activity deleteActivityById(int activityId) {
		return dao.deleteActivityById(activityId);
	}
	


}
