import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/widgets/custom_snackbar.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../cubits/edit_post_cubit/edit_post_cubit.dart';
import 'edit_post_form_widget.dart';

class PostDetailsBody extends StatelessWidget {
  const PostDetailsBody({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocConsumer<EditPostCubit, EditPostState>(
        listener: _listeningMethod,
        builder: (context, state) {
          if (state is EditPostLoading) {
            return const CustomLoadingWidget();
          } else {
            return EditPostForm(
              submitButtonText: 'Update Post',
              submitFunction: () =>
                  BlocProvider.of<EditPostCubit>(context).updatePost(post),
            );
          }
        },
      ),
    );
  }

  void _listeningMethod(context, state) async {
    if (state is EditPostFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBars.errorSnackBar(
          msg: state.failure.msg,
          context: context,
        ),
      );
    } else if (state is EditPostUpdated) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBars.successSnackBar(
          msg: 'Post is updated Successfuly!',
          context: context,
        ),
      );
    }
  }
}
