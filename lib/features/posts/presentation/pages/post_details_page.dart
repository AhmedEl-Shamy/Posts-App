import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/posts/presentation/cubits/edit_post_cubit/edit_post_cubit.dart';
import 'package:posts_app/features/posts/presentation/widgets/custom_appbar.dart';

import '../../domain/entities/post.dart';
import '../widgets/post_details_body.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)!.settings.arguments as Post;
    BlocProvider.of<EditPostCubit>(context).setDataToForm(post);
    return Scaffold(
      appBar: CustomAppBar.getAppBar(title: post.title, context: context),
      body: PostDetailsBody(post: post,),
    );
  }
}