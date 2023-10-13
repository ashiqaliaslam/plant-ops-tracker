import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/components/date_time_header/status_of_week_and_shift.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

// class TodayAuditsView extends StatelessWidget {
//   const TodayAuditsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           const StatusOfWeekAndShift(
//             color: Colors.grey,
//           ),
//           ListView(
//             children: const <Widget>[],
//           ),
//         ],
//       ),
//     );
//   }
// }

class TodayAuditsView extends StatelessWidget {
  const TodayAuditsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StickyHeader(
        header: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: const StatusOfWeekAndShift(
              color: Colors.blue,
            )),
        content: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Item num $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}
