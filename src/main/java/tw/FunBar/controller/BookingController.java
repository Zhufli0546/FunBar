package tw.FunBar.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.FunBar.model.Alltime;
import tw.FunBar.model.BookingData;
import tw.FunBar.service.BookingService;

@Controller
public class BookingController {

	@Autowired
	BookingService bookingService;


	@RequestMapping("/booking")
	public String booking() {

		return "booking";
	}

	@RequestMapping(value = "/pulltime",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Alltime> displayTime(@RequestParam(name = "date") String date,
			@RequestParam(name = "people") Integer people, Model model) {
		ArrayList<Alltime> oktime = bookingService.okTime(date, people);
		model.addAttribute("oktime", oktime);
		return oktime;
	}

	@RequestMapping("/confirm")
	public String confirm(@RequestParam(name = "date") String date, @RequestParam(name = "people") Integer people,
			@RequestParam(name = "time") String time, Model model) {

		model.addAttribute("date", date);
		model.addAttribute("people", people);
		model.addAttribute("time", time);
		return "confirm";
	}
	


	@RequestMapping("/addReservations")
	public String addrReservations(@RequestParam(name = "date") String date,
			@RequestParam(name = "people") Integer people, @RequestParam(name = "time") String time,@RequestParam(name="sex")String sex,
			@RequestParam(name = "name") String name, @RequestParam(name = "phone") String phone,
			@RequestParam(name = "email") String email, @RequestParam(name = "remark") String remark, Model model) {
		

		bookingService.addReservations(date,people,time,sex,name,phone,email,remark);
		model.addAttribute("date", date);
		return "completeOk";
	}
	
	@RequestMapping("/allbooking")
	public String queryAllBooking(Model model) {
		ArrayList<BookingData> all = bookingService.queryAllBooking();
		model.addAttribute("All", all);
		return "allbooking";
	}
	
	
	@RequestMapping("/admin/booking")
	public String adminBooking() {
		return "admin_booking";
	}
	
	@RequestMapping(value = "/pullTodayStatus",method=RequestMethod.POST)
	public String pullTodayStatus(@RequestParam(name = "date")String date,Model model) {
		ArrayList<Alltime> fulltime = bookingService.pullTime();
		ArrayList<Alltime> todayStatus = bookingService.pullTodayStatus(date);
		
		model.addAttribute("fulltime", fulltime);
		model.addAttribute("todayStatus", todayStatus);
		
		return "pullTodayStatus";
		
	}

}
