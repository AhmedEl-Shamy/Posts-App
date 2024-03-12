import 'package:posts_app/core/models/either.dart';
import 'package:posts_app/core/models/exceptions.dart';
import 'package:posts_app/core/models/failure.dart';
import 'package:posts_app/core/models/internet_checker_service.dart';
import 'package:posts_app/features/posts/data/data_sources/post_local_data_source.dart';
import 'package:posts_app/features/posts/data/data_sources/post_remote_data_source.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repo.dart';

import '../models/post_model.dart';

class PostsRepoImpl extends PostsRepo {
  final PostRemoteDataSource _postRemoteDataSource;
  final PostLocalDataSource _postLocalDataSource;
  final InternetCheckerService _internetCheckerService;

  PostsRepoImpl(
      {required PostRemoteDataSource postRemoteDataSource,
      required PostLocalDataSource postLocalDataSource,
      required InternetCheckerService internetCheckerService})
      : _postLocalDataSource = postLocalDataSource,
        _postRemoteDataSource = postRemoteDataSource,
        _internetCheckerService = internetCheckerService;

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await _internetCheckerService.isConnectedToInternet()) {
      try {
        List<Post> posts = await _postRemoteDataSource.getAllPosts();
        _postLocalDataSource.cachePosts(posts as List<PostModel>);
        return Either<Failure, List<Post>>.right(
          posts,
        );
      } on ServerException {
        return Either<Failure, List<Post>>.left(
          Failure.serverFailure(),
        );
      }
    } else {
      try {
        return Either<Failure, List<Post>>.right(
          await _postLocalDataSource.getCachedPosts(),
        );
      } on NoDataException {
        return Either<Failure, List<Post>>.left(
          Failure.noDataFailure(),
        );
      }
    }
  }

  @override
  Future<Either<Failure, bool>> addPost(Post post) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return await _doAction(() => _postRemoteDataSource.addPost(postModel));
  }

  @override
  Future<Either<Failure, bool>> deletePost(int id) async {
    return await _doAction(() => _postRemoteDataSource.deletePost(id));
  }

  @override
  Future<Either<Failure, bool>> updatePost(Post post) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return await _doAction(() => _postRemoteDataSource.updatePost(postModel));
      
  }

  Future<Either<Failure, bool>> _doAction( Future<bool> Function() action) async {
    if (await _internetCheckerService.isConnectedToInternet()) {
      try {
        return Either<Failure, bool>.right(
          await action(),
        );
      } on ServerException {
        return Either<Failure, bool>.left(
          Failure.serverFailure(),
        );
      }
    } else {
      return Either<Failure, bool>.left(
        Failure.noInternetFailure(),
      );
    }
  }
}
