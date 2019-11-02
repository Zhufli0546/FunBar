package tw.FunBar.dao;

import java.util.ArrayList;


import tw.FunBar.model.Alltime;
import tw.FunBar.model.BookingData;

public interface BookingDAO {
	
	ArrayList<Alltime> pullTime();
	
	ArrayList<Alltime> okTime(String date,Integer people);

	void addReservations(String date, Integer people, String time,String sex, String name, String phone, String email,
			String remark);
	
	ArrayList<BookingData> queryAllBooking();
	
	ArrayList<Alltime> pullTodayStatus(String date);
}
