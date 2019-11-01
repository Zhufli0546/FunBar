package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Activity;
import tw.FunBar.model.EventCategory;

public interface ActivityDao {
	
	List<Activity> getAllActivities();
	
	public Activity getActivity(int activityId);

	public void addActivity(Activity activity);
	
//	List<String> getAllCategories();
//	
//	List<Activity> getActivityByCategory(String category);
//	
//	
//	public EventCategory getCategoryById(int categoryId);
//	
//	List<EventCategory> getCategoryList();
	
}
