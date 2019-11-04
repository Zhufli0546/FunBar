package tw.FunBar.service;

import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import tw.FunBar.model.Activity;
import tw.FunBar.model.EventCategory;

public interface ActivityService {

	List<Activity> getAllActivities();

	public Activity getActivity(int activityId);

	public void addActivity(Activity activity);

	List<String> getAllActivityCategories();

	List<Activity> getActivityByCategory(String category);

//	public void updateActivity(Activity activity);
	
//	public void updateActivity(int activityId, String eventName);
	
	public void updateActivity(int activityId, String eventName, String eventDate, String address, String introduction,
			String activities, String information, String category, Blob blob );

	public void deleteActivityById(int activityId);

//	public EventCategory getCategoryById(int categoryId);
//	
//	List<EventCategory> getCategoryList();

}
