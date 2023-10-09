import 'package:flutter/foundation.dart' show immutable;
import 'package:plant_ops_tracker/state/auth/app_state/auth_result.dart';
import 'package:plant_ops_tracker/state/auth/user_id.dart';

@immutable
class UserAuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;
  final bool emailVerified;

  const UserAuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
    required this.emailVerified,
  });

  const UserAuthState.unKnown()
      : result = null,
        isLoading = false,
        userId = null,
        emailVerified = false;

  UserAuthState copiedWithIsLoading(bool isLoading) => UserAuthState(
        result: result,
        isLoading: isLoading,
        userId: userId,
        emailVerified: emailVerified,
      );

  @override
  bool operator ==(covariant UserAuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId &&
          emailVerified == other.emailVerified);

  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        userId,
        emailVerified,
      );
}
