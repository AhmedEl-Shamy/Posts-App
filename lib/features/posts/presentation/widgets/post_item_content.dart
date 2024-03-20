import 'package:flutter/material.dart';

import '../../domain/entities/post.dart';

class ListViewItemContent extends StatelessWidget {
  const ListViewItemContent({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}