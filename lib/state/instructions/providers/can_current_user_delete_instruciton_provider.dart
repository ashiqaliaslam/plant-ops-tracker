import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/providers/user_id_provider.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';

final canCurrentUserDeleteInstructionProvider = StreamProvider.autoDispose
    .family<bool, Instruction>((ref, Instruction instruction) async* {
  final userId = ref.watch(userIdProvider);
  yield userId == instruction.userId;
});
