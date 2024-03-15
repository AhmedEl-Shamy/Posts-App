part of 'edit_post_cubit.dart';

sealed class EditPostState extends Equatable {
  const EditPostState();

  @override
  List<Object> get props => [];
}

final class EditPostInitial extends EditPostState {}
final class EditPostLoading extends EditPostState {}
final class EditPostAdded extends EditPostState {}
final class EditPostUpdated extends EditPostState {}
final class EditPostDeleted extends EditPostState {}
final class EditPostFailure extends EditPostState {
  final Failure failure;
  const EditPostFailure ({required this.failure});
}

