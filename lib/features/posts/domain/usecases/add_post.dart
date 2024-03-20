import 'package:equatable/equatable.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repo.dart';

import '../../../../core/utlis/either.dart';
import '../../../../core/utlis/failure.dart';
import '../entities/post.dart';

class AddPosts extends Equatable {
  final PostsRepo postsRepo;
  const AddPosts(this.postsRepo);

  Future<Either<Failure, bool>> call (Post post) => postsRepo.addPost(post);

  @override
  List<Object?> get props => [];
}