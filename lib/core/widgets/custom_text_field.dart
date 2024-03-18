import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.label,
    required this.isRequired,
    required this.maxLines,
    super.key,
  });
  final TextEditingController controller;
  final String label;
  final bool isRequired;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      validator: (value) => (value!.isEmpty)? '$label is required' : null,
      decoration: InputDecoration(
        hintText: 'Enter Post $label',
        label: Text.rich(
          TextSpan(
            text: label,
            children: [
              if (isRequired)
                const TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: _createBorder(context, false),
        enabledBorder: _createBorder(context, false),
        errorBorder: _createBorder(context, true),
      ),
    );
  }

  OutlineInputBorder _createBorder(BuildContext context, bool isError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}