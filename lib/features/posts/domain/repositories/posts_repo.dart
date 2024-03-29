import 'package:posts_app/core/utlis/either.dart';
import 'package:posts_app/core/utlis/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, bool>> deletePost(int id);
  Future<Either<Failure, bool>> updatePost(Post post);
  Future<Either<Failure, bool>> addPost(Post post);
}