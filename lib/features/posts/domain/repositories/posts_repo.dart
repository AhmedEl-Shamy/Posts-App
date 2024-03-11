import 'package:equatable/equatable.dart';
import 'package:posts_app/core/models/either.dart';
import 'package:posts_app/core/models/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';

abstract class PostsRepo extends Equatable {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, bool>> deletePost(int id);
  Future<Either<Failure, bool>> updatePost(Post post);
  Future<Either<Failure, bool>> addPost(Post post);
}