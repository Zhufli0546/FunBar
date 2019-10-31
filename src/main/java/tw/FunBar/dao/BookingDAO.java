package tw.FunBar.dao;

import java.util.ArrayList;


import tw.FunBar.model.Alltime;

public interface BookingDAO {
	
	ArrayList<Alltime> pullTime();
	
	ArrayList<Alltime> okTime(String date,Integer people);
}
