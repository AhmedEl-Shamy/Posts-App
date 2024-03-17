import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/models/services_config.dart';
import 'package:posts_app/features/posts/presentation/pages/add_post_page.dart';

import 'features/posts/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesConfig.init();
  runApp(const PostsApp());
}

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      routes: {
        '/addPost' :(context) => const AddPostPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: BlocProvider(
        create: (context) => ServicesConfig.postsCubit..getPosts(),
        child: const HomePage(),
      ),
    );
  }
}
