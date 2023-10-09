import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/app_state/app_state_notifier.dart';
import 'package:plant_ops_tracker/state/auth/app_state/user_auth_state.dart';

final authStateProvider =
    StateNotifierProvider<AppStateNotifier, UserAuthState>(
        (ref) => AppStateNotifier());
