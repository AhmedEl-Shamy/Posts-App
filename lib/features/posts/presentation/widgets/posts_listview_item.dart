import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';
import 'post_item_content.dart';

class PostsListViewItem extends StatelessWidget {
  const PostsListViewItem({required this.post, super.key});

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/postDetails', arguments: post),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)),
          constraints: const BoxConstraints(
            maxHeight: 200,
          ),
          padding: const EdgeInsets.all(10),
          child: ListViewItemContent(post: post),
        ),
      ),
    );
  }
}
