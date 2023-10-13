// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:plant_ops_tracker/state/enums/department.dart';
// import 'package:plant_ops_tracker/state/enums/operating_area.dart';
// import 'package:plant_ops_tracker/state/enums/shift_group.dart';
// import 'package:plant_ops_tracker/state/audits/models/audit.dart';
// import 'package:plant_ops_tracker/recurrence/enum/week_number.dart';
// import 'package:uuid/uuid.dart';

// const _uuid = Uuid();

// class TaskList extends Notifier<List<Audit>> {
//   @override
//   List<Audit> build() => [
//         Audit(
//           auditId: '0',
//           dueDay: 13,
//           dueWeek: WeekNumber.week2,
//           dueShift: ShiftGroup.eveningShift,
//           dueDate: DateTime.now(),
//           operatingArea: OperatingArea.allAreas,
//           auditTitle: 'Damaged or missing insulation audit',
//           formatAvailable: false,
//         ),
//         Audit(
//           auditId: '1',
//           dueDay: 13,
//           dueWeek: WeekNumber.week2,
//           dueShift: ShiftGroup.nightShift,
//           dueDate: DateTime.now(),
//           operatingArea: OperatingArea.allAreas,
//           auditTitle: 'Steam Drum GLG Flushing',
//           formatAvailable: false,
//         ),
//       ];

//   // void add(int dueDay, WeekNumber dueWeek)
// }
