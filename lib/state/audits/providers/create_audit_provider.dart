import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/notifiers/audit_create_notifier.dart';
import 'package:plant_ops_tracker/state/audits/typedefs/is_loading.dart';

final createAuditProvider =
    StateNotifierProvider<AuditCreateNotifier, IsLoading>(
        (ref) => AuditCreateNotifier());
