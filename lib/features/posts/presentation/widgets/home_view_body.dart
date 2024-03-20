import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_listview.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../cubits/posts_cubit/posts_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsSuccess) {
          return PostsListView(
            posts: state.posts,
          );
        } else if (state is PostsFailure) {
          return CustomErrorWidget(failure: state.failure);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}