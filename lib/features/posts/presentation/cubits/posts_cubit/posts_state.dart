part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsSuccess extends PostsState {
  final List<Post> posts;
  const PostsSuccess({required this.posts});
}

final class PostsLoading extends PostsState {}
final class PostDeleted extends PostsState {}

final class PostsFailure extends PostsState {
  final Failure failure;
  const PostsFailure({required this.failure});
}
