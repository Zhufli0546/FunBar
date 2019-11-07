package tw.FunBar.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.RoomDAO;
import tw.FunBar.model.Room;
import tw.FunBar.service.RoomService;


@Service
@Transactional
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomDAO roomDAO;
	
	
	@Override
	public Set<Room> pullRoom(String date, Integer stay,Integer rooms) throws ParseException {
		
		return roomDAO.pullRoom(date, stay,rooms);
	}


	@Override
	public void addRoom(Room room) {
		
		roomDAO.addRoom(room);
	}


	@Override
	public Room getImage(Integer room_id) {
		
		return roomDAO.getImage(room_id);
	}


	@Override
	public ArrayList<Room> allRoom() {
		
		return roomDAO.allRoom();
	}


	@Override
	public Room getRoomById(Integer room_id) {
		
		return roomDAO.getRoomById(room_id);
	}

	
	

}
