import 'package:flutter/material.dart';

extension HexToColor on String {
  Color toColor() {
    String hexCode = replaceAll('#', '');
    if (hexCode.length == 3) {
      // split each character, double each character, and join them together
      hexCode = hexCode.split('').map((char) => char * 2).join('');
    }
    // add 'FF' to the start of string, and then parse (return) the
    // resulting string as base-16 integer
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
