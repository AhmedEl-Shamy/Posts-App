import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubits/edit_post_cubit/edit_post_cubit.dart';

class EditPostForm extends StatelessWidget {
  const EditPostForm({
    super.key,
    required this.submitButtonText,
    required this.submitFunction,
  });

  final String submitButtonText;
  final void Function() submitFunction;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<EditPostCubit>(context).formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: BlocProvider.of<EditPostCubit>(context).titleController,
            label: 'Title',
            isRequired: true,
            maxLines: 1,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            controller: BlocProvider.of<EditPostCubit>(context).bodyController,
            label: 'Body',
            isRequired: true,
            maxLines: 5,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            text: submitButtonText,
            onPressed: submitFunction,
          ),
        ],
      ),
    );
  }

}
