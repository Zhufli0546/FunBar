package tw.FunBar.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.FunBar.model.Activity;
import tw.FunBar.service.ActivityService;

@Controller
public class ActivityController {

	ActivityService service;

	@Autowired
	public void setService(ActivityService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	@RequestMapping("/activities")
	public String list(Model model) {
		List<Activity> list = service.getAllActivities();
		model.addAttribute("activities", list);
		return "activities";
	}

	@RequestMapping("/activity")
	public String getActivity(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("activity", service.getActivity(id));
		return "activity";
	}

	@RequestMapping(value = "/addActivity", method = RequestMethod.GET)
	public String input(Model model) {
		model.addAttribute("activity", new Activity());
		return "addActivity";
	}

	@RequestMapping(value = "/activities", method = RequestMethod.POST)
	public String addActivity(Activity activity) {
		Activity ac = new Activity();
		MultipartFile activityImage = ac.getActivityImage();
		String originalFilename = activityImage.getOriginalFilename();
		ac.setFileName(originalFilename);
		if (activityImage != null && !activityImage.isEmpty()) {
			try {
				byte[] b = activityImage.getBytes();
				Blob blob = new SerialBlob(b);
				ac.setPicture(blob);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		service.addActivity(activity);

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");

		try {
			File imageFolder = new File(rootDirectory, "activityimages");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, ac.getActivityId() + ext);
			activityImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect: activities";
	}

	@RequestMapping(value = "/getPicture/{activityId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPitcure(HttpServletResponse resp, @PathVariable Integer activityId) {
		String filePath = "/views/activityimages/wine.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		Activity ac = service.getActivity(activityId);
		if (ac != null) {
			Blob blob = ac.getPicture();
			filename = ac.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				media = toByArray(filePath);
				filename = filePath;
			}
		}else {
			media = toByArray(filePath);
			filename = filePath;
		}

		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int)size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

//	public void whiteListing(WebDataBinder binder) {
//		binder.setAllowedFields("activityimage");
//	}

//	@RequestMapping("/queryByCategory")
//	public String getAllCategoryList(Model model) {
//		List<String> list = service.getAllCategories();
//		model.addAttribute("categoryList", list);
//		return "types/category";
//	}
//	
//	@RequestMapping("/activities/{category}")
//	public String getActivityByCategory(@PathVariable("category") String category, Model model) {
//		List<Activity> activities = service.getActivityByCategory(category);
//		model.addAttribute("activities", activities);
//		return "activities";
//		
//	}

//	@RequestMapping("")
//	public String getAddNewActivityForm(Model model) {
//		Activity ac = new Activity();
//		model.addAttribute("Activity", ac);
//		return "addActivity";
//	}
//	
//	@RequestMapping(value = "" ,method = RequestMethod.GET)
//	public String processAddNewActivityForm(@ModelAttribute("activity") Activity ac) {
//		service.addActivity(ac);
//		return "addActivity";
//	}
//	
//	@ModelAttribute("")
//	public Map<Integer, String> getEventCategoryList(){
//		 Map<Integer, String> categorymap = new HashMap<>();
//		 List<EventCategory> list = service.getCategoryList();
//		 for(EventCategory ec : list) {
//			 categorymap.put(ec.getCategoryId(), ec.getCategoryName());
//		 }
//		 return categorymap;
//	}

}
