import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_listview_item.dart';

import '../../domain/entities/post.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.posts, super.key});
  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 40,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Dismissible(
              key: Key(posts[index].id.toString()),
              child: PostsListViewItem(post: posts[index])),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: posts.length,
        ),
      ),
    );
  }
}
