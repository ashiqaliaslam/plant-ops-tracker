import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class TimeState extends StateNotifier<DateTime> {
  Timer? _timer;

  TimeState() : super(DateTime.now()) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
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

  String get nowDate => DateFormat('dd-MMM-yyy').format(state);

  String get nowMonth => DateFormat('MMMM').format(state);

  String get nowDayName => DateFormat('EEEE').format(state);

  int get nowDayCount => state.day;

  int get weekNumber => (nowDayCount / 7).ceil();
}

final dateTimeProvider =
    StateNotifierProvider<TimeState, DateTime>((ref) => TimeState());

// final timeProvider = Provider<String>((ref) {
//   final currentTime = ref.watch(dateTimeProvider);
//   return DateFormat('hh:mm:ss').format(currentTime);
// });
