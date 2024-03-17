import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/services_config.dart';
import '../cubits/edit_post_cubit/edit_post_cubit.dart';
import '../widgets/add_post_body.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditPostCubit(
        addPosts: ServicesConfig.addPosts,
        deletePost: ServicesConfig.deletePost,
        updatePost: ServicesConfig.updatePost,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Post'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        body: const AddPostBody(),
      ),
    );
  }
}
