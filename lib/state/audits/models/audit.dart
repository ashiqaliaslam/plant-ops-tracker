import 'package:plant_ops_tracker/state/audits/models/audit_key.dart';

// class Audit {
//   final String auditId;
//   final String auditTitle;
//   final List<DateTime>? dueDate;
//   final List<int> dueDay;
//   final List<ShiftGroup> dueShift;
//   final List<WeekNumber> dueWeek;
//   final List<Month> dueMonth;
//   final List<OperatingArea> operatingArea;
//   final bool formatAvailable;
//   final AuditStatus? auditStatus;

//   Audit({
//     required this.auditId,
//     required Map<String, dynamic> json
//   })  : auditTitle = json[AuditKey.auditTitle],
//         dueDate = json[AuditKey.dueDate],
//         dueDay = json[AuditKey.dueDay],
//         dueShift = json[AuditKey.dueShift],
//         dueWeek = json[AuditKey.dueWeek],
//         dueMonth = json[AuditKey.dueMonth],
//         operatingArea = json[AuditKey.operatingArea],
//         formatAvailable = json[AuditKey.formatAvailable],
//         auditStatus = json[AuditKey.auditStatus];

//   // Audit({
//   //   required this.auditId,
//   //   required this.auditTitle,
//   //   this.dueDate,
//   //   required this.dueDay,
//   //   required this.dueShift,
//   //   required this.dueWeek,
//   //   required this.dueMonth,
//   //   required this.operatingArea,
//   //   required this.formatAvailable,
//   //   this.auditStatus = AuditStatus.notStarted,
//   // });
// }

class Audit {
  final String auditId;
  final String userId;
  final String auditTitle;
  // final List<ShiftGroup> dueShifts;
  // final List<WeekNumber> dueWeeks;
  // final List<OperatingArea> operatingAreas;
  // final List<DateTime>? dueDates;
  // final List<int>? dueDays;
  // final List<Month>? dueMonths;
  // final bool formatAvailable;
  // final AuditStatus? auditStatus;

  Audit({
    required this.auditId,
    required Map<String, dynamic> json,
  })  : userId = json[AuditKey.userId],
        auditTitle = json[AuditKey.auditTitle]
  // dueShifts = json[AuditKey.dueShift]
  //     ?.map(
  //         (shift) => ShiftGroup.values.firstWhere((s) => s.name == shift))
  //     .toList()
  // dueWeeks = json[AuditKey.dueWeek]
  // operatingAreas = json[AuditKey.operatingArea]
  // dueDates = json[AuditKey.dueDate]
  // dueDays = json[AuditKey.dueDay]
  // dueMonths = json[AuditKey.dueMonth]
  // formatAvailable = json[AuditKey.formatAvailable]
  // auditStatus = json[AuditKey.auditStatus]

  ;
}

//   factory Audit.fromJson(Map<String, dynamic> json) {
//     return Audit(
//       // auditTitle: json['auditTitle'],
//       dueShifts: json['dueShifts']?.map((shift) => ShiftGroup.values.firstWhere((s) => s.name == shift)).toList(),
//       dueWeeks: json['dueWeeks']?.map((week) => WeekNumber.values.firstWhere((w) => w.name == week)).toList(),
//       operatingAreas: json['operatingAreas']?.map((area) => OperatingArea.values.firstWhere((o) => o.name == area)).toList(),
//       dueDates: json['dueDates']?.map((date) => DateTime.parse(date)).toList(),
//       dueDays: json['dueDays']?.map((day) => int.parse(day)).toList(),
//       dueMonths: json['dueMonths']?.map((month) => Month.values.firstWhere((m) => m.name == month)).toList(),
//       formatAvailable: json['formatAvailable'] ?? false,
//       auditStatus: json['auditStatus'] != null ? AuditStatus.values.firstWhere((s) => s.name == json['auditStatus']) : null,
//     );
//   }
// static Audit fromMap(Map<String, dynamic> map) {
//     return Audit(
//       // auditTitle: map[AuditKey.auditTitle],
//       dueShifts: (map[AuditKey.dueShifts] as List).map((shift) => ShiftGroup.fromShortString(shift)).toList(),
//       dueWeeks: (map[AuditKey.dueWeeks] as List).map((week) => WeekNumber.fromShortString(week)).toList(),
//       areas: (map[AuditKey.areas] as List).map((area) => OperatingArea.fromShortString(area)).toList(),
//       dueDate: map[AuditKey.dueDate] != null ? DateTime.fromMillisecondsSinceEpoch(map[AuditKey.dueDate]) : null,
//       dueDays: (map[AuditKey.dueDays] as List).map((day) => WeekNumber.fromShortString(day)).toList(),
//       dueMonths: (map[AuditKey.dueMonths] as List).map((month) => Months.fromShortString(month)).toList(),
//     );
// }



// Map<String, dynamic> toJson() {
//   return {
//     // 'auditId': auditId,
//     'auditTitle': auditTitle,
//     'dueDates': dueDates?.map((date) => date.toIso8601String()).toList(),
//     'dueDays': dueDays?.map((day) => day.toString()).toList(),
//     'dueShifts': dueShifts?.map((shift) => shift.name).toList(),
//     'dueWeeks': dueWeeks?.map((week) => week.name).toList(),
//     'dueMonths': dueMonths?.map((month) => month.name).toList(),
//     'operatingAreas': operatingAreas?.map((area) => area.name).toList(),
//     'formatAvailable': formatAvailable,
//     'auditStatus': auditStatus?.name,
//   };
// }

// Map<String, dynamic> toMap() {
//   return {
//     // AuditKey.auditId: auditId,
//     AuditKey.auditTitle: auditTitle,
//     AuditKey.dueDate: dueDate?.millisecondsSinceEpoch,
//     AuditKey.dueDays: dueDays?.map((day) => day.toShortString()).toList(),
//     AuditKey.dueShifts:
//         dueShifts?.map((shift) => shift.toShortString()).toList(),
//     AuditKey.dueWeeks: dueWeeks?.map((week) => week.toShortString()).toList(),
//     AuditKey.dueMonths:
//         dueMonths?.map((month) => month.toShortString()).toList(),
//     AuditKey.areas: areas?.map((area) => area.toShortString()).toList(),
//   };
// }
