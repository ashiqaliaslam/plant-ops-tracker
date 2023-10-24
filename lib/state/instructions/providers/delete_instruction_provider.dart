import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/typedefs/is_loading.dart';
import 'package:plant_ops_tracker/state/instructions/notifiers/delete_instruction_notifier.dart';

final deleteInstructionProvider =
    StateNotifierProvider<DeleteInstructionStateNotifier, IsLoading>(
        (ref) => DeleteInstructionStateNotifier());
