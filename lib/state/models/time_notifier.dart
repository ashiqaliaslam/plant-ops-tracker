import 'dart:async' show Timer;

import 'package:hooks_riverpod/hooks_riverpod.dart'
    show StateNotifier, StateNotifierProvider;
import 'package:intl/intl.dart' show DateFormat;

class DateTimeState extends StateNotifier<DateTime> {
  Timer? _timer;

  DateTimeState() : super(DateTime.now()) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        // state = DateTime.now();
        state = DateTime.now();
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get nowTime => DateFormat('HH:mm:ss').format(state);
  // String get nowTime1 => state.datetimoTo24Hours();

  DateTime get nowDate {
    if (state.hour < 7) {
      return state.subtract(const Duration(days: 1));
    } else {
      return state;
    }
  }

  String get nowDateString {
    return DateFormat('dd-MMM-yyyy').format(nowDate);
  }

  String get nowDayName => DateFormat('EEE').format(nowDate);

  int get nowDayCount => nowDate.day;

  int get weekNumber => (nowDayCount / 7).ceil();

  String get nowMonthName => DateFormat('MMMM').format(nowDate);

  String get shift {
    final hours = state.hour;
    if (hours >= 7 && hours < 15) {
      return 'Morning';
    } else if (hours >= 15 && hours < 23) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }
}

final dateTimeProvider =
    StateNotifierProvider<DateTimeState, DateTime>((ref) => DateTimeState());
