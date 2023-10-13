import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:plant_ops_tracker/state/auth/user_id.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';
import 'package:plant_ops_tracker/state/enums/instruction_issuer.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions_key.dart';

@immutable
class Instruction {
  final String instructionId;
  final UserId userId;
  final String title;
  final String? description;
  // final List<String>? steps;
  final List<Department?> department;
  final DateTime? createdAt;
  // final DateTime? updatedAt;
  final InstructionIssuer? instructionIssuer;
  // final Priority? priority;
  // final bool isActive;
  // final String? comments;

  Instruction({
    required this.instructionId,
    required Map<String, dynamic> json,
  })  : userId = json[InstructionKey.userId],
        title = json[InstructionKey.title],
        description = json[InstructionKey.description] != null
            ? json[InstructionKey.description] as String
            : null,
        createdAt = json[InstructionKey.createdAt] != null
            ? (json[InstructionKey.createdAt] as Timestamp).toDate()
            : null,
        // department = Department.parse(json[InstructionKey.department])
        department = (json[InstructionKey.department] as List)
            .map((department) => Department.parse(department))
            .toList(),
        // instructionIssuer = InstructionIssuer.values.firstWhere(
        //   (manager) => manager.name == json[InstructionKey.instructionIssuer],
        //   orElse: () => InstructionIssuer.sop,
        // )
        // instructionIssuer = json[InstructionKey.instructionIssuer] != null
        //     ? (json[InstructionKey.instructionIssuer])
        //     : null
        instructionIssuer = InstructionIssuer.parse(
          json[InstructionKey.instructionIssuer],
        )
  // instructionIssuer = InstructionIssuer.parse(instructionIssuer.toString())

  // / [working]
  // department = Department.values.firstWhere(
  //   (department) => department.name == 'departments',
  //   orElse: () => Department.allDepartments,
  // )

  // department = Department.parse(json[InstructionKey.department])

  // department = json[InstructionKey.department] != null
  //     ? Department.parse(json[InstructionKey.department])
  //     : Department.allDepartments

  // add more fields
  ;
}
