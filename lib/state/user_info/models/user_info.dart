import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;
import 'package:plant_ops_tracker/state/auth/user_id.dart';
import 'package:plant_ops_tracker/state/constants/firebase_field_name.dart';
import 'package:plant_ops_tracker/state/user_info/models/role.dart';

@immutable
class UserInfo extends MapView<String, dynamic> {
  final UserId userId;
  final String displayName;
  final String? email;
  final Role role;

  UserInfo({
    required this.userId,
    required this.displayName,
    required this.email,
    required this.role,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email,
          FirebaseFieldName.role: role,
        });

  UserInfo.fromJson(
    Map<String, dynamic> json, {
    required UserId userId,
  }) : this(
          userId: userId,
          displayName: json[FirebaseFieldName.displayName] ?? '',
          email: json[FirebaseFieldName.email],
          role: json[FirebaseFieldName.role],
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          displayName == other.displayName &&
          email == other.email &&
          role == other.role;

  @override
  int get hashCode => Object.hashAll([
        userId,
        displayName,
        email,
        role,
      ]);
}
