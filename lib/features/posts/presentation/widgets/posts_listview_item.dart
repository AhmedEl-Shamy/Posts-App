import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';

class PostsListViewItem extends StatelessWidget {
  const PostsListViewItem({required this.post, super.key});

  final Post post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/postDetails', arguments: post),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)),
          constraints: const BoxConstraints(
            maxHeight: 200,
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                post.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                post.body,
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
