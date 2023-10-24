import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      autofocus: false,
      maxLines: 3,
      minLines: 1,
      decoration: const InputDecoration(
        labelText: Strings.title,
        hintText: Strings.titleOfInstruction,
        border: OutlineInputBorder(),
      ),
    );
  }
}
