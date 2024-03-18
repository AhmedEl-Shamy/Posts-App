import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              submitFunction: () => BlocProvider.of<EditPostCubit>(context).updatePost(post),
            );
          }
        },
      ),
    );
  }
  
  void _listeningMethod(context, state) async {
    if (state is EditPostFailure) {
      await showDialog(
        context: context,
        builder: (ctx) => _getMessage(
          title: 'Error',
          msg: state.failure.msg,
          context: context,
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      );
    } else if (state is EditPostAdded) {
      await showDialog(
        context: context,
        builder: (ctx) => _getMessage(
          title: 'Post Updated',
          msg: 'Post is updated Successfuly!',
          context: context,
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      );
    }
  }

  AlertDialog _getMessage({
    required String msg,
    required String title,
    required BuildContext context,
    required void Function() onPressed,
  }) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text('OK'),
        ),
      ],
    );
  }
}