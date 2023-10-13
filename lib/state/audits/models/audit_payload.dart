import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;
import 'package:plant_ops_tracker/state/audits/models/audit_key.dart';
import 'package:plant_ops_tracker/state/auth/user_id.dart';

@immutable
class AuditPayload extends MapView<String, dynamic> {
  AuditPayload({
    // final String auditId;
    required UserId userId,
    required String auditTitle,
    // required List<ShiftGroup> dueShifts,
  }) : super({
          AuditKey.userId: userId,
          AuditKey.auditTitle: auditTitle,
          // AuditKey.dueShift: dueShifts,
        });
}
