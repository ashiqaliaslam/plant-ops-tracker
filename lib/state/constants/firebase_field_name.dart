import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const userId = 'uid';
  static const auditId = 'audit_id';
  static const talkId = 'talk_id';
  static const email = 'email';
  static const displayName = 'display_name';

  const FirebaseFieldName._();
}
