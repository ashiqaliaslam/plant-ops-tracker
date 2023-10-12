import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/models/audit_payload.dart';
import 'package:plant_ops_tracker/state/audits/typedefs/is_loading.dart';
import 'package:plant_ops_tracker/state/constants/firebase_collection_name.dart';

// class ImageUploadNotifier extends StateNotifier<IsLoading>
class AuditCreateNotifier extends StateNotifier<IsLoading> {
  AuditCreateNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> createAudit({
    required String userId,
    required String auditTitle,
    // required List<ShiftGroup> dueShifts,
  }) async {
    isLoading = true;

    try {
      final auditPayload = AuditPayload(
        userId: userId,
        auditTitle: auditTitle,
        // dueShifts: dueShifts,
      );
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.audits)
          .add(auditPayload);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
