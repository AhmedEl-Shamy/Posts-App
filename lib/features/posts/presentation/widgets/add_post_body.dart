import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/posts/presentation/cubits/edit_post_cubit/edit_post_cubit.dart';

import '../../../../core/widgets/loading_widget.dart';
import 'edit_post_form_widget.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocConsumer<EditPostCubit, EditPostState>(
        listener: _listeningMethod,
        builder: (context, state) {
          String? errorText;
          if (state is EditPostInputsFailure) {
            errorText = state.failure.msg;
          }
          if (state is EditPostLoading) {
            return const CustomLoadingWidget();
          } else {
            return EditPostForm(
              submitButtonText: 'Add Post',
              submitFunction: BlocProvider.of<EditPostCubit>(context).addPost,
              errorText: errorText,
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
          title: 'Post Added',
          msg: 'Post is Added Successfuly!',
          context: context,
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      );
      if (context.mounted) {
        Navigator.of(context).pop();
      }
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
