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
    this.errorText,
  });

  final String submitButtonText;
  final void Function() submitFunction;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: BlocProvider.of<EditPostCubit>(context).titleController,
          label: 'Title',
          isRequired: true,
          maxLines: 1,
          errorText: errorText,
        ),
        const SizedBox(
          height: 40,
        ),
        CustomTextField(
          controller: BlocProvider.of<EditPostCubit>(context).bodyController,
          label: 'Body',
          isRequired: true,
          maxLines: 5,
          errorText: errorText,
        ),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
          text: submitButtonText,
          onPressed: submitFunction,
        ),
      ],
    );
  }

}
