import 'package:equatable/equatable.dart';

import '../../../../core/utlis/either.dart';
import '../../../../core/utlis/failure.dart';
import '../entities/post.dart';
import '../repositories/posts_repo.dart';

class GetAllPosts extends Equatable {
  final PostsRepo postsRepo;
  const GetAllPosts(this.postsRepo);

  Future<Either<Failure, List<Post>>> call () => postsRepo.getAllPosts();

  @override
  List<Object?> get props => [];
}