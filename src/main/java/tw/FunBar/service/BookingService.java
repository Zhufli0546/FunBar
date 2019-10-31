package tw.FunBar.service;

import java.util.ArrayList;



import tw.FunBar.model.Alltime;

public interface BookingService {
	
	ArrayList<Alltime> pullTime();
	
	ArrayList<Alltime> okTime(String date,Integer people);
}
