package tw.FunBar.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.DiscussDAO;
import tw.FunBar.model.Like;
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
	public void createPost(Post post) {
		dao.createPost(post);
		
	}

	@Transactional
	@Override
	public List<Like> getAllLike() {
		return dao.getAllLike();
	}
	
	@Transactional
	@Override
	public void createLike(Like like) {
		dao.createLike(like);
	}
	
	
}
