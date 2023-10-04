import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Colors;
import 'package:plant_ops_tracker/extensions/hex_to_flutter_color.dart';

@immutable
class AppColors {
  static final loginButtonColor = '#cfc9c2'.toColor();
  static const loginButtonTextColor = Colors.black;
  static final googleColor = '#4285F4'.toColor();
  static final facebookColor = '#3b5998'.toColor();
  const AppColors._();
}
