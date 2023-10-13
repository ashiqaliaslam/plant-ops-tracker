import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/providers/create_audit_provider.dart';
import 'package:plant_ops_tracker/state/auth/providers/auth_state_provider.dart';

final isLoadingProvider = Provider((ref) {
  final applicationState = ref.watch(authStateProvider);
  final isCreatingAudit = ref.watch(createAuditProvider);

  return applicationState.isLoading || isCreatingAudit;
});
