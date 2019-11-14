package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.DiscussDAO;
import tw.FunBar.model.Friendship;
import tw.FunBar.model.LikePost;
import tw.FunBar.model.Member;
import tw.FunBar.model.Post;
import tw.FunBar.service.DiscussService;

@Service
public class DiscussServiceImpl implements DiscussService {

	DiscussDAO dao;

	@Autowired
	public void setDao(DiscussDAO dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public List<Post> getAllPostDetail() {
		return dao.getAllPostDetail();
	}

	@Transactional
	@Override
	public Post findByIdPost(int postId) {
		return dao.findByIdPost(postId);

	}

	@Transactional
	@Override
	public void createPost(Post post) {
		dao.createPost(post);

	}

	@Transactional
	@Override
	public void updatePostContent(Post post) {
		dao.updatePostContent(post);

	}

	@Transactional
	@Override
	public void deletePostContent(Integer postId) {
		dao.deletePostContent(postId);

	}

	@Transactional
	@Override
	public long getLikeByPostId(Integer postId) {
		return dao.getLikeByPostId(postId);
	}

	@Transactional
	@Override
	public void addLike(LikePost like) {
		dao.addLike(like);
	}

	@Transactional
	@Override
	public void unLike(LikePost like) {
		dao.unLike(like);

	}

	@Transactional
	@Override
	public void sendFriendRequest(Friendship friendship) {
		dao.sendFriendRequest(friendship);
	}

	@Transactional
	@Override
	public List<Member> searchMember(String memberName) {
		return dao.searchMember(memberName);
	}

	@Transactional
	@Override
	public List<LikePost> getLikesById(Integer memberId) {
		return dao.getLikesById(memberId);
	}

	@Transactional
	@Override
	public List<Friendship> getAllFriendRequest() {
		return dao.getAllFriendRequest();
	}

	@Transactional
	@Override
	public void confirmFriendRequest(Friendship friendship) {
		dao.confirmFriendRequest(friendship);

	}

}
