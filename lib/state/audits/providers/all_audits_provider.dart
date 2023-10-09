import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/models/audit.dart';
import 'package:plant_ops_tracker/state/constants/firebase_collection_name.dart';

final allAuditsProvider = StreamProvider.autoDispose<Iterable<Audit>>((ref) {
  final controller = StreamController<Iterable<Audit>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.audits)
      .snapshots()
      .listen((snapshot) {
    final audits = snapshot.docs.map(
      (doc) => Audit(
        auditId: doc.id,
        json: doc.data(),
      ),
    );
    controller.sink.add(audits);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
