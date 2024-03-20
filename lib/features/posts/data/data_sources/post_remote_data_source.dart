import 'dart:convert';

import 'package:posts_app/core/utlis/api_service.dart';

import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<bool> updatePost(PostModel postModel);
  Future<bool> deletePost(int postId);
  Future<bool> addPost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final APIService apiService;
  PostRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<PostModel>> getAllPosts() async {
    final postsJson = await apiService.get(endPoint: 'posts');
    List<PostModel> postModels = (json.decode(postsJson) as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
    return postModels;
  }

  @override
  Future<bool> addPost(PostModel postModel) async {
    Map<String, dynamic> body = {
      'title': postModel.title,
      'body': postModel.body,
    };
    return await apiService.post(endPoint: 'posts', body: body);
  }

  @override
  Future<bool> deletePost(int postId) async {
    return await apiService.delete(endPoint: 'posts', data: postId);
  }

  @override
  Future<bool> updatePost(PostModel postModel) async {
    Map<String, dynamic> body = {
      'title': postModel.title,
      'body': postModel.body,
    };
    return await apiService.update(
        endPoint: 'posts', data: postModel.id, body: body);
  }
}
