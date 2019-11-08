package tw.FunBar.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import antlr.collections.impl.IntRange;
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
		List<Post> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public Post findByIdPost(int postId) {
		Session session = factory.getCurrentSession();
		Post post = session.get(Post.class, postId);
		return post;
	}
	
	@Override
	public void createPost(Post post) {
		Session session = factory.getCurrentSession();
		int id = (int) (Math.floor(Math.random() * 99999999) + 10000000);
		post.setMemberId(id);
		Date dateTime = new Date();
		SimpleDateFormat formDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = formDate.format(dateTime);
		post.setPostTime(date);
		session.save(post);
	}
	
	@Override
	public void updatePostContent(Post post) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Post post SET post.postContent = :postContent WHERE post.postId = :postId";
		session.createQuery(hql).setParameter("postContent", post.getPostContent()).setParameter("postId", post.getPostId()).executeUpdate();
		
	}
	
	@Override
	public void deletePostContent(Integer postId) {
		Session session = factory.getCurrentSession();
		Post post = new Post();
		post.setPostId(postId);
		session.delete(post);
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
