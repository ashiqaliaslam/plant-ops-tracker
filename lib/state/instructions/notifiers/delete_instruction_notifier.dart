import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/typedefs/is_loading.dart';
import 'package:plant_ops_tracker/state/constants/firebase_collection_name.dart';
import 'package:plant_ops_tracker/state/instructions/models/instruction_id.dart';

class DeleteInstructionStateNotifier extends StateNotifier<IsLoading> {
  DeleteInstructionStateNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> deleteInstruction({
    required InstructionId instructionId,
  }) async {
    try {
      isLoading = true;
      final query = FirebaseFirestore.instance
          .collection(FirebaseCollectionName.instructions)
          .doc(instructionId);

      final docSnapshot = await query.get();
      if (!docSnapshot.exists) {
        throw Exception('Instruction not found');
      }

      await query.delete();
      return true;

      // await query.then((query) async {
      //   for (final doc in query.data())
      // });
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
