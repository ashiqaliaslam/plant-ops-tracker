import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plant_ops_tracker/state/enums/instruction_issuer.dart';

class InstructionIssuerDropdown extends HookWidget {
  final TextEditingController instructionIssuerController;

  const InstructionIssuerDropdown({
    super.key,
    required this.instructionIssuerController,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<InstructionIssuer>(
      decoration: const InputDecoration(
        labelText: 'Instruction Issuer',
        hintText: 'Select Instruction Issuer',
      ),
      items: InstructionIssuer.values.map((issuer) {
        return DropdownMenuItem<InstructionIssuer>(
          value: issuer,
          child: Text(issuer.name),
        );
      }).toList(),
      onChanged: (issuer) {
        instructionIssuerController.text = issuer.toString().split('.').last;
      },
    );
  }
}
