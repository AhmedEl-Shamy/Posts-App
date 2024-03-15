part of 'posts_cubit_cubit.dart';

sealed class PostsCubitState extends Equatable {
  const PostsCubitState();

  @override
  List<Object> get props => [];
}

final class PostsCubitInitial extends PostsCubitState {}

final class PostsCubitSuccess extends PostsCubitState {
  final List<Post> posts;
  const PostsCubitSuccess({required this.posts});
}

final class PostsCubitLoading extends PostsCubitState {}

final class PostsCubitFailure extends PostsCubitState {
  final Failure failure;
  const PostsCubitFailure({required this.failure});
}
