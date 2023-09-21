import 'package:flutter/foundation.dart' show immutable;
import 'package:plant_ops_tracker/state/auth/models/auth_result.dart';
import 'package:plant_ops_tracker/state/auth/user_id.dart';

@immutable
class AuthStateApp {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;

  const AuthStateApp({
    required this.result,
    required this.isLoading,
    required this.userId,
  });

  const AuthStateApp.unKnown()
      : result = null,
        isLoading = false,
        userId = null;

  AuthStateApp copiedWithIsLoading(bool isLoading) => AuthStateApp(
        result: result,
        isLoading: isLoading,
        userId: userId,
      );

  @override
  bool operator ==(covariant AuthStateApp other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  @override
  int get hashCode => Object.hash(result, isLoading, userId);
}
