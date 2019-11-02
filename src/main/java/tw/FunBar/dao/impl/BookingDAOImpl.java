package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.dao.BookingDAO;
import tw.FunBar.model.Alltime;
import tw.FunBar.model.BookingData;

@Repository
public class BookingDAOImpl implements BookingDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	
	@Override
	public ArrayList<Alltime> pullTime() {
		
		ArrayList<Alltime> Alltime = new ArrayList<Alltime>();
		
		Session session = sessionFactory.getCurrentSession();
		String hql="From Alltime";
		  List<Alltime> query = session.createQuery(hql).list();
		  
		  for(Alltime time : query) {
			  Alltime.add(time);
		  }
		  
		  return Alltime;
	
	}



	@Override
	public ArrayList<Alltime> okTime(String date, Integer people) {
			ArrayList<Alltime> alltime = pullTime();
			
			ArrayList<Alltime> oktime = new ArrayList<>();
			Calendar now = Calendar.getInstance();
			now.setTime(new Date());
			int year = now.get(Calendar.YEAR);
			int month = now.get(Calendar.MONTH) +1;
			int day = now.get(Calendar.DAY_OF_MONTH);

			String today = year+"-"+month+"-"+day;


			int H = now.get(Calendar.HOUR_OF_DAY);
			

			
			for(Alltime all:alltime) {
				String BH = all.getTime().substring(0,2);
				int bh = Integer.parseInt(BH);
			String hql="from BookingData where date=:date and time=:time";
			Session session = sessionFactory.getCurrentSession();
			ArrayList<BookingData> query =(ArrayList<BookingData>)session.createQuery(hql).setParameter("date",date).setParameter("time",all.getTime()).getResultList();
			int sum = 0 ;
			for(BookingData data : query) {
				sum += data.getPeople();
			}
			
			if(sum+people<=all.getPeople()&&date.equals(today)&&bh>H) {
				oktime.add(all);
			}else if(sum+people<=all.getPeople()&&!date.equals(today)){
			    oktime.add(all);
			}
			}
			
			return oktime;
	}

	@Override
	public void addReservations(String date, Integer people, String time,String sex, String name, String phone, String email,
			String remark) {
		BookingData d = new BookingData();
		d.setDate(date);
		d.setTime(time);
		d.setPeople(people);
		d.setEmail(email);
		d.setName(name);
		d.setSex(sex);
		d.setPhone(phone);
		d.setRemark(remark);
		
		Session session = sessionFactory.getCurrentSession();
		session.save(d);
	}



	@Override
	public ArrayList<BookingData> queryAllBooking() {
		
		String hql = "From BookingData order by date asc" ;
		ArrayList<BookingData> bookings = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		bookings = (ArrayList<BookingData>)session.createQuery(hql).getResultList();
		return bookings;
		
	}



	@Override
	public ArrayList<Alltime> pullTodayStatus(String date) {
		Integer peo = 0 ;
		String hql = "From BookingData where date = :date and time = :time";
		Session session = sessionFactory.getCurrentSession();
		ArrayList<Alltime> alltime = pullTime();
		
		ArrayList<Alltime> todayStatus = new ArrayList<>();
		
		for(Alltime all : alltime) {
		ArrayList<BookingData> query =(ArrayList<BookingData>)session.createQuery(hql).setParameter("date",date).setParameter("time",all.getTime()).getResultList();
		for(BookingData data : query) {
			peo += data.getPeople();
		}
		int lastPeo = all.getPeople()-peo;
		peo = 0 ;
		
		Alltime onetime = new Alltime();
		onetime.setTime(all.getTime());
		onetime.setPeople(lastPeo);
		todayStatus.add(onetime);
		}
		
		return todayStatus;
	}

}
