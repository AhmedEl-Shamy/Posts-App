import 'package:equatable/equatable.dart';

import '../../../../core/utlis/either.dart';
import '../../../../core/utlis/failure.dart';
import '../repositories/posts_repo.dart';

class DeletePost extends Equatable {
  final PostsRepo postsRepo;
  const DeletePost(this.postsRepo);

  Future<Either<Failure, bool>> call (int id) => postsRepo.deletePost(id);

  @override
  List<Object?> get props => [];
}