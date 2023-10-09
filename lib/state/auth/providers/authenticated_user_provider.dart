import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/app_state/authenticator.dart';

final authenticatedUserProvider =
    Provider<Authenticator>((ref) => const Authenticator());
