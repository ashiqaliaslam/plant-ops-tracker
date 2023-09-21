import 'package:plant_ops_tracker/state/enums/audit_status.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';
import 'package:plant_ops_tracker/state/enums/operating_area.dart';
import 'package:plant_ops_tracker/state/enums/shift_group.dart';
import 'package:plant_ops_tracker/recurrence/enum/week_number.dart';

class Audit {
  final String id;
  // final DateTime startTime;
  // final DateTime endTime;
  final int dueDay;
  final WeekNumber dueWeek;
  final ShiftGroup shift;
  final DateTime dueDate;
  final OperatingArea operatingArea;
  final String auditTitle;
  final Department department;
  final bool formatAvailable;
  final AuditStatus auditStatus;

  Audit({
    required this.id,
    required this.dueDay,
    required this.dueWeek,
    required this.shift,
    required this.dueDate,
    required this.operatingArea,
    required this.auditTitle,
    required this.department,
    required this.formatAvailable,
    this.auditStatus = AuditStatus.notStarted,
  });
}
