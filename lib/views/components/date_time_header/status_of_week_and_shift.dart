import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/models/time_notifier.dart';
import 'package:plant_ops_tracker/views/components/date_time_header/icon_and_value.dart';

class StatusOfWeekAndShift extends StatelessWidget {
  const StatusOfWeekAndShift({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final dateTime = ref.watch(dateTimeProvider.notifier);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndValue(
              icon: Icons.calendar_today,
              title: "${dateTime.nowDayName}  ${dateTime.nowDateString}",
              color: color,
            ),
            IconAndValue(
              icon: Icons.view_week,
              title: dateTime.weekNumber.toString(),
              color: color,
            ),
            IconAndValue(
              icon: Icons.work,
              title: dateTime.shift,
              color: color,
            ),
          ],
        );
      },
    );
  }
}
