package tw.FunBar.dao.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import tw.FunBar.dao.DiscussDAO;
import tw.FunBar.model.Post;

@Repository
public class DiscussDAOImpl implements DiscussDAO {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> getAllPostDetail() {
		String hql = "FROM Post ORDER BY postTime desc";
		Session session = null;
		List<Post> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void createPost(Post post) {
		Session session = factory.getCurrentSession();
		int id = (int) (Math.floor(Math.random()*99999999)+10000000);
		post.setMemberId(id);
		//post.setPostId(4);
		Date dateTime = new Date();
		SimpleDateFormat formDate = new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");
		String date =formDate.format(dateTime);
		System.out.println(date);
		post.setPostTime(date);
//		post.setParentPostId(2);
		session.save(post);
	}
	
	
}
