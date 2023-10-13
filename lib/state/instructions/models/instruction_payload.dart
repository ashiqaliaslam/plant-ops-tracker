import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_ops_tracker/state/auth/user_id.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';
import 'package:plant_ops_tracker/state/enums/instruction_issuer.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions_key.dart';

class InstructionPayload extends MapView<String, dynamic> {
  InstructionPayload({
    required UserId userId,
    required String title,
    required String description,
    required List<Department?> department,
    required InstructionIssuer? instructionIssuer,
  }) : super({
          InstructionKey.userId: userId,
          InstructionKey.title: title,
          InstructionKey.createdAt: FieldValue.serverTimestamp(),
          InstructionKey.description: description,
          InstructionKey.department: department
              .map((department) => department.toString().split('.').last)
              .toList(),
          InstructionKey.instructionIssuer:
              instructionIssuer.toString().split('.').last,
        });
}
