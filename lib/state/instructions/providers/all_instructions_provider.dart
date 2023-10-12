import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/constants/firebase_collection_name.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';

final allInstructionsProvider = StreamProvider<Iterable<Instruction>>((ref) {
  final controller = StreamController<Iterable<Instruction>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.instructions)
      // .where(FirebaseFieldName.instructionId) // TODO:s
      .snapshots()
      .listen((snapshot) {
    final instruction = snapshot.docs
        .map((doc) => Instruction(instructionId: doc.id, json: doc.data()));
    controller.sink.add(instruction);
  });
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
