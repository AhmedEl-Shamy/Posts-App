import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/models/api_service.dart';
import 'package:posts_app/core/models/internet_checker_service.dart';
import 'package:posts_app/features/posts/data/data_sources/post_local_data_source.dart';
import 'package:posts_app/features/posts/data/data_sources/post_remote_data_source.dart';
import 'package:posts_app/features/posts/data/repositories/post_repo_impl.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repo.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts_cubit/posts_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class ServicesConfig {
  static late final PostsCubit postsCubit;
  static late final APIService apiService;
  static late final PostsRepo postsRepo;
  static late final PostLocalDataSourceImpl postLocalDataSourceImpl;
  static late final PostRemoteDataSource postRemoteDataSource;
  static late final InternetCheckerService internetCheckerService;
  static late final SharedPreferences sharedPreferences;
  static late final GetAllPosts getAllPosts;
  static late final DeletePost deletePost;
  static late final UpdatePost updatePost;
  static late final AddPosts addPosts;

  static Future<void> init() async {
    // data Sources
    sharedPreferences = await SharedPreferences.getInstance();
    apiService = APIServiceImpl(client: Client());
    postLocalDataSourceImpl = PostLocalDataSourceImpl(sharedPreferences: sharedPreferences);
    postRemoteDataSource = PostRemoteDataSourceImpl(apiService: apiService);
    internetCheckerService = InternetCheckerServiceImpl(InternetConnectionChecker());
    
    // Repos
    postsRepo = PostsRepoImpl(
      postRemoteDataSource: postRemoteDataSource,
      postLocalDataSource: postLocalDataSourceImpl,
      internetCheckerService: internetCheckerService,
    );

    // UseCases
    getAllPosts = GetAllPosts(postsRepo);
    addPosts = AddPosts(postsRepo);
    updatePost = UpdatePost(postsRepo);
    deletePost = DeletePost(postsRepo);

    // Global Cubits
    postsCubit = PostsCubit(
      getAllPosts: getAllPosts,
      updatePost: updatePost,
      addPosts: addPosts,
      deletePost: deletePost,
    );
  }
}
