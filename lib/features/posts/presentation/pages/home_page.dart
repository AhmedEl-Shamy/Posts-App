import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/widgets/error_widget.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/features/posts/presentation/widgets/home_view_body.dart';

import '../cubits/posts_cubit/posts_cubit.dart';

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
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsSuccess) {
            return HomeViewBody(
              posts: state.posts,
            );
          } else if (state is PostsFailure) {
            return CustomErrorWidget(failure: state.failure);
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
