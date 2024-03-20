import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/utlis/either.dart';
import 'package:posts_app/core/utlis/failure.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts.dart';

import '../../../domain/entities/post.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({
    required GetAllPosts getAllPosts,
    required DeletePost deletePost,
  }) : _deletePost = deletePost, _getAllPosts = getAllPosts, super(PostsInitial());

  final GetAllPosts _getAllPosts;
  final DeletePost _deletePost;

  void getPosts() async {
    emit(PostsLoading());
    Either<Failure, List<Post>> either = await _getAllPosts();
    either.fold(
      onLeft: (failure) {
        emit(PostsFailure(failure: failure));
      },
      onRight: (posts) {
        emit(PostsSuccess(posts: posts));
      },
    );
  }

  void deletePost(Post post) async {
    emit(PostsLoading());
    Either<Failure, bool> either = await _deletePost(post.id);
    either.fold(onLeft: (failure) {
      emit(PostsFailure(failure: failure));
    }, onRight: (value) {
      emit(PostDeleted());
    });
    getPosts();
  }
}
