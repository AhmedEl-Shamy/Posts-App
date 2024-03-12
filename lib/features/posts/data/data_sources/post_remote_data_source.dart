import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<bool> updatePost(PostModel postModel);
  Future<bool> deletePost(int postId);
  Future<bool> addPost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {

  
  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }
  
  @override
  Future<bool> addPost(PostModel postModel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}