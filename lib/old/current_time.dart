import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/extensions/time_to_24hrs_string.dart';

class CurrentTime extends StatefulWidget {
  const CurrentTime({super.key});

  @override
  State<CurrentTime> createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        return setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      // TimeOfDay.now().to24Hours(),
      TimeOfDay.now().to24Hours(second: DateTime.now().second),
    );
  }
}
