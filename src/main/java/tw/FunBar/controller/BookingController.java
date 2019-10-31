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
	
	SessionFactory sessionFactory;
	
	@RequestMapping("/booking")
	public String booking(Model model,HttpServletRequest request) {
		model.addAttribute("AllTime", bookingService.pullTime());
		request.setAttribute("AllTime", bookingService.pullTime());
		return "booking";
	}
	
	@RequestMapping(value="/pulltime")
	@ResponseBody
	public ArrayList<Alltime> displayTime(@RequestParam(name="date")String date,@RequestParam(name="people")Integer people,Model model) {

		ArrayList<Alltime> oktime = bookingService.okTime(date, people);
		model.addAttribute("oktime", oktime);
			return oktime;
	}
	
	@RequestMapping("/confirm")
	public String confirm(@RequestParam(name="date")String date,@RequestParam(name="people")Integer people,@RequestParam(name="time")String time,Model model) {
		
		model.addAttribute("date", date);
		model.addAttribute("people", people);
		model.addAttribute("time", time);
		return "confirm";
	}

}
