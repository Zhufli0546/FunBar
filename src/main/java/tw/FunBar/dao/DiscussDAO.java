package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Like;
import tw.FunBar.model.Post;

public interface DiscussDAO {

	List<Post> getAllPostDetail();
	
	void createPost(Post post);

	List<Like> getAllLike();
}
