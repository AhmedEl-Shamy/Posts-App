import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/models/failure.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post.dart';

import '../../../../../core/models/either.dart';
import '../../../domain/entities/post.dart';

part 'edit_post_state.dart';

class EditPostCubit extends Cubit<EditPostState> {
  EditPostCubit({
    required AddPosts addPosts,
    required DeletePost deletePost,
    required UpdatePost updatePost,
  })  : _addPosts = addPosts,
        _updatePost = updatePost,
        _deletePost = deletePost,
        super(EditPostInitial());

  final AddPosts _addPosts;
  final DeletePost _deletePost;
  final UpdatePost _updatePost;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  void addPost() async {
    final Post post = Post(
      id: 0,
      title: titleController.text,
      body: bodyController.text,
    );
    emit(EditPostLoading());
    Either<Failure, bool> either = await _addPosts(post);
    either.fold(onLeft: (failure) {
      emit(EditPostFailure(failure: failure));
    }, onRight: (value) {
      emit(EditPostAdded());
    });
  }

  void deletePost(Post post) async {
    emit(EditPostLoading());
    Either<Failure, bool> either = await _deletePost(post.id);
    either.fold(onLeft: (failure) {
      emit(EditPostFailure(failure: failure));
    }, onRight: (value) {
      emit(EditPostDeleted());
    });
  }

  void updatePost(Post post) async {
    emit(EditPostLoading());
    Either<Failure, bool> either = await _updatePost(post);
    either.fold(onLeft: (failure) {
      emit(EditPostFailure(failure: failure));
    }, onRight: (value) {
      emit(EditPostAdded());
    });
  }
}
