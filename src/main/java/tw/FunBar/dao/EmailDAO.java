package tw.FunBar.dao;

<<<<<<< HEAD

=======
>>>>>>> 4ab830ef33a649f9ab8ba73de3bbadb1c006dae8
import java.util.List;

import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.BookingData;
import tw.FunBar.model.Member;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;

public interface EmailDAO {
		void sendEmail(RoomOrder room_order,Room room);

		void sendBookingEmail(BookingData data);
<<<<<<< HEAD


		void sendmembercheck(Member mail);



		void sendActivityEmail(Applicant email,Activity activity);
		

=======

		void sendmembercheck(Member mail);

		
		void sendActivityEmail(Applicant email,Activity activity);
		
>>>>>>> 4ab830ef33a649f9ab8ba73de3bbadb1c006dae8
}
