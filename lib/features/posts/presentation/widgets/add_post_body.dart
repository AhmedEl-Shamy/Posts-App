import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/posts/presentation/cubits/edit_post_cubit/edit_post_cubit.dart';

import '../../../../core/widgets/custom_snackbar.dart';
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
          if (state is EditPostLoading) {
            return const CustomLoadingWidget();
          } else {
            return EditPostForm(
              submitButtonText: 'Add Post',
              submitFunction: BlocProvider.of<EditPostCubit>(context).addPost,
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
    } else if (state is EditPostAdded) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBars.successSnackBar(
          msg: 'Post is added Successfuly!',
          context: context,
        ),
      );
    }
  }
}
