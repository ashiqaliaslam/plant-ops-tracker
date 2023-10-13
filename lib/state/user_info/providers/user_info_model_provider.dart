import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/user_id.dart';
import 'package:plant_ops_tracker/state/constants/firebase_collection_name.dart';
import 'package:plant_ops_tracker/state/constants/firebase_field_name.dart';
import 'package:plant_ops_tracker/state/user_info/models/user_info.dart';

final userInfoProvider =
    StreamProvider.family.autoDispose<UserInfo, UserId>((ref, UserId userId) {
  final controller = StreamController<UserInfo>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.users)
      .where(FirebaseFieldName.userId, isEqualTo: userId)
      .limit(1)
      .snapshots()
      .listen((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first;
      final json = doc.data();
      final userInfo = UserInfo.fromJson(
        json,
        userId: userId,
      );
      controller.add(userInfo);
    }
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
