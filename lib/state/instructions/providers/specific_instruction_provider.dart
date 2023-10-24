import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/constants/firebase_collection_name.dart';
import 'package:plant_ops_tracker/state/instructions/models/instruction_id.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';

final specificInstructionProvider =
    StreamProvider.family.autoDispose<Instruction, InstructionId>((
  ref,
  instructionId,
) {
  final controller = StreamController<Instruction>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.instructions)
      .doc(instructionId)
      .snapshots()
      .listen((snapshot) {
    // if (snapshot.exists) {
    //   final instruction =
    //       Instruction(instructionId: instructionId, json: snapshot.data()!);
    //   controller.sink.add(instruction);
    // } else {
    //   controller.sink.addError('Instruction not found');
    // }
    final data = snapshot.data();
    if (data == null) {
      return;
    }
    final insttruction = Instruction(instructionId: snapshot.id, json: data);
    controller.sink.add(insttruction);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
