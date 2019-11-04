package tw.FunBar.dao;

import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import tw.FunBar.model.Activity;

public interface ActivityDao {
	
	List<Activity> getAllActivities();
	
	public Activity getActivity(int activityId);

	public void addActivity(Activity activity);
	
	List<String> getAllActivityCategories();
	
	List<Activity> getActivityByCategory(String category);
	
	public void updateActivity(int activityId, String eventName, String eventDate, String address, String introduction,
			String activities, String information, String category, Blob blob);
	
//	public void updateActivity(int activityId, String eventName);
	
//	public void updateActivity(Activity activity);
	
	public void deleteActivityById(int activityId);

	
}
