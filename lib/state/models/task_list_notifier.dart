import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';
import 'package:plant_ops_tracker/state/enums/operating_area.dart';
import 'package:plant_ops_tracker/state/enums/shift_group.dart';
import 'package:plant_ops_tracker/state/models/audit.dart';
import 'package:plant_ops_tracker/recurrence/enum/week_number.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TaskList extends Notifier<List<Audit>> {
  @override
  List<Audit> build() => [
        Audit(
          id: '0',
          dueDay: 13,
          dueWeek: WeekNumber.week2,
          shift: ShiftGroup.eveningShift,
          dueDate: DateTime.now(),
          operatingArea: OperatingArea.allAreas,
          auditTitle: 'Damaged or missing insulation audit',
          department: Department.operation,
          formatAvailable: false,
        ),
        Audit(
          id: '1',
          dueDay: 13,
          dueWeek: WeekNumber.week2,
          shift: ShiftGroup.nightShift,
          dueDate: DateTime.now(),
          operatingArea: OperatingArea.allAreas,
          auditTitle: 'Steam Drum GLG Flushing',
          department: Department.operation,
          formatAvailable: false,
        ),
      ];

  // void add(int dueDay, WeekNumber dueWeek)
}
