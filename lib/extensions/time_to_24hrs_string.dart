// import 'package:flutter/material.dart';

// extension TimeOfDayTo24Hours on TimeOfDay {
//   String to24Hours() {
//     final hour = this.hour.toString().padLeft(2, "0");
//     final minute = this.minute.toString().padLeft(2, "0");
//     final second = this.minute / 60;
//     final seconds = second.toString().padLeft(2, "0");
//     return "$hour:$minute:$seconds";
//   }
// }

import 'package:flutter/material.dart';

extension TimeOfDayTo24Hours on TimeOfDay {
  String to24Hours({int second = 0}) {
    final hour = this.hour.toString().padLeft(2, "0");
    final minute = this.minute.toString().padLeft(2, "0");
    final seconds = second.toString().padLeft(2, "0");

    return "$hour:$minute:$seconds";
  }
}
