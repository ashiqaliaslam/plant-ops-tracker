import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateView extends StatelessWidget {
  final DateTime dateTime;
  const DateView({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('d MMM, yyyy');
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
      ),
      child: Text(
        formatter.format(dateTime),
      ),
    );
  }
}
