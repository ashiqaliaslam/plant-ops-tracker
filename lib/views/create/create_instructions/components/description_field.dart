import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: descriptionController,
      maxLines: 8,
      minLines: 2,
      decoration: const InputDecoration(
        labelText: Strings.description,
        hintText: Strings.descriptionOfInstruction,
        border: OutlineInputBorder(),
      ),
    );
  }
}
