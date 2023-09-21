// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';

// final currentDateTimeProvider =
//     Provider<CurrentDateTime>((ref) => CurrentDateTime());

// // final nowProvider = StateNotifierProvider((ref) => DateTime.now());

// class CurrentDateTime {
//   final DateTime dateTime;

//   CurrentDateTime() : dateTime = DateTime(2023, 1, 1, 0, 0);
//   // CurrentDateTime() : dateTime = DateTime.now();

//   String get currentDate {
//     return DateFormat('dd-MMM-yyyy').format(dateTime);
//   }

//   String get currentMonth {
//     return DateFormat('MMMM').format(dateTime);
//   }

//   String get currentDayName {
//     return DateFormat('EEEE').format(dateTime);
//   }

//   String get currentTime {
//     return DateFormat('HH:mm:ss').format(dateTime);
//   }

//   String time() {
//     return DateFormat('HH:mm:ss').format(dateTime);
//   }

//   int get currentWeekNumber {
//     int dayOfYear = int.parse(DateFormat('D').format(dateTime));
//     return ((dayOfYear - dateTime.weekday + 10) / 7).floor();
//   }

//   int get currentDay => dateTime.day;

//   int get weekNo {
//     int weekOfMonth;
//     int dayOfMonth = int.parse(DateFormat('d').format(dateTime));

//     if (dayOfMonth <= 7) {
//       weekOfMonth = 1;
//     } else if (dayOfMonth <= 14) {
//       weekOfMonth = 2;
//     } else if (dayOfMonth <= 21) {
//       weekOfMonth = 3;
//     } else if (dayOfMonth <= 28) {
//       weekOfMonth = 4;
//     } else {
//       weekOfMonth = 5;
//     }
//     return weekOfMonth;
//   }

//   int get weekNmbr {
//     return (dateTime.day / 7).ceil();
//   }

//   int get weekNumber {
//     // Get the first day of the month
//     DateTime firstDayOfMonth =
//         dateTime.subtract(Duration(days: dateTime.day - 1));

//     // Get the weekday of the first day of the month
//     int weekday = firstDayOfMonth.weekday;

//     // Calculate the week number
//     int weekNumber = (weekday + 6) ~/ 7;
//     return weekNumber;
//   }
// }
