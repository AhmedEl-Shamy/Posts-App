import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/models/either.dart';
import 'package:posts_app/core/models/failure.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post.dart';

import '../../../domain/entities/post.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({
    required this.getAllPosts,
    required this.updatePost,
    required this.addPosts,
    required this.deletePost,
  }) : super(PostsInitial());

  final GetAllPosts getAllPosts;
  final UpdatePost updatePost;
  final AddPosts addPosts;
  final DeletePost deletePost;
  late List<Post> posts;

  void getPosts() async {
    emit(PostsLoading());
    Either<Failure, List<Post>> either = await getAllPosts();
    either.fold(
      onLeft: (failure) {
        emit(PostsFailure(failure: failure));
      },
      onRight: (posts) {
        emit(PostsSuccess(posts: posts));
      },
    );
  }
}
