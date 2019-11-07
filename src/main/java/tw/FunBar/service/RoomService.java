package tw.FunBar.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Set;

import tw.FunBar.model.Room;

public interface RoomService {
		
	ArrayList<Room> allRoom();
	
	Set<Room> pullRoom(String date , Integer stay,Integer rooms) throws ParseException;

	void addRoom(Room room);
	
	Room getImage(Integer room_id);

	Room getRoomById(Integer room_id);
}
