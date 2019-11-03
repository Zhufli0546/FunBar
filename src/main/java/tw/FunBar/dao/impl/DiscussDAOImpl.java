package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.DiscussDAO;
import tw.FunBar.model.Like;
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
		int id = (int) (Math.floor(Math.random() * 99999999) + 10000000);
		post.setMemberId(id);
		// post.setPostId(4);
		Date dateTime = new Date();
		// SimpleDateFormat formDate = new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");
		// String date =formDate.format(dateTime);
		// System.out.println(date);
		post.setPostTime(dateTime);
//		post.setParentPostId(2);
		session.save(post);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Integer getLikeByPostId(int postId) {
		Integer count = 0;
		String hql = "SELECT COUNT(DISTINCT postId) FROM Like WHERE postId = :postId";
		Session session = factory.getCurrentSession();
//		System.out.println("Checkpoint" + session.createQuery(hql));
		List<Integer> list = session.createQuery(hql).setParameter("postId", postId).list();
		System.out.println(list);
		if (list.size() > 0) {
			count = list.get(0);
		}
		return count;
	}

	@Override
	public void createLike(Like like) {
		Session session = factory.getCurrentSession();
		session.save(like);
	}

}
