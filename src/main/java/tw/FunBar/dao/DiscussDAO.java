package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.LikePost;
import tw.FunBar.model.Post;

public interface DiscussDAO {

	List<Post> getAllPostDetail();
	
	void createPost(Post post);

	long getLikeByPostId(Integer postId);
	
	void addLike(LikePost like);
	
	void unLike(LikePost like);
	
	
}
