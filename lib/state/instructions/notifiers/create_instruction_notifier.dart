import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/typedefs/is_loading.dart';
import 'package:plant_ops_tracker/state/constants/firebase_collection_name.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';
import 'package:plant_ops_tracker/state/enums/instruction_issuer.dart';
import 'package:plant_ops_tracker/state/enums/priority.dart';
import 'package:plant_ops_tracker/state/instructions/models/instruction_payload.dart';

// class ImageUploadNotifier extends StateNotifier<IsLoading>
class CreateInstructionNotifier extends StateNotifier<IsLoading> {
  CreateInstructionNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> createInstruction({
    required String userId,
    required String title,
    required String description,
    required List<Department?> department,
    required InstructionIssuer? instructionIssuer,
    required PriorityLevel? priority,
    required bool isActive,
    required List<String?> steps,
  }) async {
    isLoading = true;

    try {
      final instructionPayload = InstructionPayload(
        userId: userId,
        title: title,
        description: description,
        department: department,
        instructionIssuer: instructionIssuer,
        priority: priority,
        isActive: isActive,
        steps: steps,
      );
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.instructions)
          .add(instructionPayload);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
