package tw.FunBar.dao;

import tw.FunBar.model.BookingData;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;

public interface EmailDAO {
		void sendEmail(RoomOrder room_order,Room room);

		void sendBookingEmail(BookingData data);
}
