import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/widgets/custom_appbar.dart';

import '../widgets/add_post_body.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(title: 'Add Post', context: context),
      body: const AddPostBody(),
    );
  }
}
