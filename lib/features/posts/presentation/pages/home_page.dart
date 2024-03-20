import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/widgets/custom_appbar.dart';

import '../widgets/home_view_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          Navigator.of(context).pushNamed('/addPost');
        },
        child: const Icon(Icons.add),
      ),
      appBar: CustomAppBar.getAppBar(title: 'Posts', context: context),
      body: const HomeViewBody(),
    );
  }
}
