package tw.FunBar.service;

import tw.FunBar.model.BookingData;
import tw.FunBar.model.Member;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;

public interface EmailService {
		
		public void sendEmail(RoomOrder room_order,Room room);

		public void sendBookingEmail(BookingData data);

		void sendmembercheck(Member mail);
}
