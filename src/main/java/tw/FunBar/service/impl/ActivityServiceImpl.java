package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.ActivityDao;
import tw.FunBar.model.Activity;
import tw.FunBar.model.EventCategory;
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
	
//	@Transactional
//	@Override
//	public List<String> getAllCategories() {
//		return dao.getAllCategories();
//	}
//	
//	@Transactional
//	@Override
//	public List<Activity> getActivityByCategory(String category) {
//		return dao.getActivityByCategory(category);
//	}
//	
//
//	@Transactional
//	@Override
//	public EventCategory getCategoryById(int categoryId) {
//		return dao.getCategoryById(categoryId);
//	}
//
//	@Transactional
//	@Override
//	public List<EventCategory> getCategoryList() {
//		return dao.getCategoryList();
//	}


}
