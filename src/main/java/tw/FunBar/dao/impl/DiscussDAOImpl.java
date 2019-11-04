package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.DiscussDAO;
import tw.FunBar.model.LikePost;
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
	public long getLikeByPostId(Integer postId) {
		long count = 0;
		String hql = "SELECT COUNT(DISTINCT memberId) FROM LikePost WHERE postId = :postId";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql).setParameter("postId", postId).getResultList();
		System.out.println(list.get(0));
		count = list.get(0);
		return count;
	}

	@Override
	public void addLike(LikePost like) {
		Session session = factory.getCurrentSession();
//		int id = (int) (Math.floor(Math.random() * 99999999) + 10000000);
//		LikePost like = new LikePost();
//		like.setMemberId(id);
		session.save(like);
	}

	@Override
	public void unLike(LikePost like) {
		String hql = "DELETE FROM LikePost WHERE postId = :postId AND memberId = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("postId", like.getLikePK().getPostId())
		.setParameter("memberId", like.getLikePK().getMemberId()).executeUpdate();
		
	}
	
	

}
