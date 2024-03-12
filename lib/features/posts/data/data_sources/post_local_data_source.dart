import 'dart:convert';

import 'package:posts_app/core/models/exceptions.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<bool> cachePosts(List<PostModel> posts);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;
  PostLocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<bool> cachePosts(List<PostModel> posts) {
    List postModelsToJson = posts.map((e) => e.toJson(e)).toList();
    return sharedPreferences.setString(
        'cached_posts', json.encode(postModelsToJson));
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    String? cachedPosts = sharedPreferences.getString('cached_posts');
    if (cachedPosts != null) {
      List<PostModel> posts =
          (json.decode(cachedPosts) as List<Map<String, dynamic>>)
              .map((e) => PostModel.fromJson(e))
              .toList();
      return Future<List<PostModel>>.value(posts);
    } else {
      throw NoDataException();
    }
  }
}
