import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts_cubit/posts_cubit.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_listview_item.dart';

import '../../domain/entities/post.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({required this.posts, super.key});
  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => BlocProvider.of<PostsCubit>(context).getPosts(),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      
        shrinkWrap: true,
        itemBuilder: (context, index) => Dismissible(
            key: Key(posts[index].id.toString()),
            child: PostsListViewItem(post: posts[index])),
        itemCount: posts.length,
      ),
    );
  }
}
