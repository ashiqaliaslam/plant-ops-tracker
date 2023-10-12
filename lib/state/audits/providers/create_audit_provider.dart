import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/notifiers/create_audit_notifier.dart';
import 'package:plant_ops_tracker/state/audits/typedefs/is_loading.dart';

final createAuditProvider =
    StateNotifierProvider<AuditCreateNotifier, IsLoading>(
        (ref) => AuditCreateNotifier());
