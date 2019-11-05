package tw.FunBar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookingRoomController {
	
	@RequestMapping("/booking_room")
	public String bookingRoom() {
		return "booking_room";
	}
}
