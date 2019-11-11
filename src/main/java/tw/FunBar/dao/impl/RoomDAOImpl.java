package tw.FunBar.dao.impl;
import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Set;

import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import tw.FunBar.dao.RoomDAO;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;


@Repository
public class RoomDAOImpl implements RoomDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public Set<Room> pullRoom(String date, Integer stay,Integer rooms) throws ParseException {
		
		ArrayList<Room> all = allRoom();
		
		
		SimpleDateFormat fm =   new SimpleDateFormat("yyyy-MM-dd" );
		
		Date D = fm.parse(date);
		
		Calendar calendar   =   new GregorianCalendar();
		
		calendar.setTime(D);
		
		D = calendar.getTime();
		
		String check_in_time = fm.format(D);
		
		Set<Room> allroom = new HashSet<>();
		
		
		for(int j = 1;j<=all.size();j++) {
			
			String hql = "From RoomOrder Where check_in_time =:check_in_time and room_id =:room_id";

			int x = 0;
			for(int i = 1 ; i<=stay ; i++) {
			Session session = sessionFactory.getCurrentSession();
			ArrayList<RoomOrder> r = (ArrayList<RoomOrder>) session.createQuery(hql).setParameter("check_in_time",check_in_time).setParameter("room_id",j).getResultList();
			int TypeCount = 0;
			for(RoomOrder rs : r) {
				TypeCount += rs.getRooms();
			}
			
			
			
			if(all.get(j-1).getRoom_quantity()-TypeCount >=rooms) {
					x += 1 ;
			  }else {
				  	x -= 1 ;
			  }

			calendar.add(Calendar.DATE,1);
			D = calendar.getTime();
			check_in_time = fm.format(D);
			
			}
			
			if(x==stay) {
				allroom.add(all.get(j-1));
			}
			
			D = fm.parse(date);
			
			calendar.setTime(D);
			
			D = calendar.getTime();
			
			check_in_time = fm.format(D);
		}
		
		return allroom ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Room> allRoom() {
		String hql ="From Room";
		Session session = sessionFactory.getCurrentSession();
		ArrayList<Room> all = (ArrayList<Room>)session.createQuery(hql).getResultList();
		
		return all;
	}

	@Override
	public void addRoom(Room room) {
		MultipartFile imageCover = room.getImageCover();
		String originalFilename = imageCover.getOriginalFilename();
		System.out.println("originalFilename:" +originalFilename);
		room.setRoom_image_filename(originalFilename);
		if (imageCover != null && !imageCover.isEmpty()) {
			try {
				byte[] b = imageCover.getBytes();
				Blob blob = new SerialBlob(b);
				room.setRoom_image(blob);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Session session = sessionFactory.getCurrentSession();
		session.save(room);
		
		
	}

	@Override
	public Room getImage(Integer room_id) {
		Session session = sessionFactory.getCurrentSession();
		Room room = session.get(Room.class,room_id);
		
		return room ;
	}

	@Override
	public Room getRoomById(Integer room_id) {
		Session session = sessionFactory.getCurrentSession();
		Room room = session.get(Room.class,room_id);
		return room;
	}

}
