import 'package:equatable/equatable.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repo.dart';

import '../../../../core/utlis/either.dart';
import '../../../../core/utlis/failure.dart';
import '../entities/post.dart';

class UpdatePost extends Equatable {
  final PostsRepo postsRepo;
  const UpdatePost(this.postsRepo);

  Future<Either<Failure, bool>> call (Post post) => postsRepo.updatePost(post);

  @override
  List<Object?> get props => [];
}