package tw.FunBar.dao;

<<<<<<< HEAD


=======
import java.util.List;

import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
>>>>>>> 391ec280c7a55b7e66a96b6f5fd3aa74bbd8d0cb
import tw.FunBar.model.BookingData;
import tw.FunBar.model.Member;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;

public interface EmailDAO {
		void sendEmail(RoomOrder room_order,Room room);

		void sendBookingEmail(BookingData data);
<<<<<<< HEAD

		void sendmembercheck(Member mail);


=======
		
		void sendActivityEmail(Applicant email,Activity activity);
		
>>>>>>> 391ec280c7a55b7e66a96b6f5fd3aa74bbd8d0cb
}
