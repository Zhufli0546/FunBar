package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Like;
import tw.FunBar.model.Post;

public interface DiscussService {

	List<Post> getAllPostDetail();
	
	void createPost(Post post);

	List<Like> getAllLike();
	
}
