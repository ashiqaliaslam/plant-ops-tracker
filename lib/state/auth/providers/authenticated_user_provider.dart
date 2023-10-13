import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/providers/auth_state_provider.dart';

final authenticatedUserProvider =
    Provider((ref) => ref.watch(authStateProvider.notifier).authenticator);
