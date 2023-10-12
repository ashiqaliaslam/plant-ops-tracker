import 'package:plant_ops_tracker/extensions/log.dart';

enum Department {
  allDepartments,
  civil,
  electrical,
  hse,
  piping,
  inspection,
  infoTech,
  operation,
  instrument,
  machinery

  // function closing semicolon
  ;

  static const Map<Department, String> _nameMap = {
    Department.allDepartments: 'All Departments',
    Department.civil: 'Civil',
    Department.electrical: 'Electrical',
    Department.hse: 'HSE',
    Department.piping: 'Piping',
    Department.inspection: 'Inspection',
    Department.infoTech: 'IT',
    Department.operation: 'Operation',
    Department.instrument: 'Instrument',
    Department.machinery: 'Machinery',
  };

  String get name => _nameMap[this]!;

  // static Department? parse(String name) {
  //   return _nameMap.keys.firstWhere(
  //     (department) => department.name == name,
  //   );
  // }

  // static Department? parse(String name) {
  //   'Parsing Department name $name'.log();
  //   final matchingEntry = _nameMap.entries.firstWhere(
  //     (entry) => entry.value == name,
  //     orElse: () => const MapEntry(Department.allDepartments, ''),
  //   );
  //   'Matched Department ${matchingEntry.key.name}'.log();
  //   return matchingEntry.key;
  // }
  static Department? parse(String name) {
    'Parsing Department name $name'.log();
    final matchingEntry = Department.values.firstWhere(
      (department) =>
          department.toString().split('.').last.toLowerCase() ==
          name.toLowerCase(),
      orElse: () => Department.allDepartments,
    );
    'Matched Department ${matchingEntry.name}'.log();
    return matchingEntry;
  }
}


// void main() {
//   final civil = Department.civil; 
//   print(civil);      /// Department.civil
//   print(civil.index);    /// `
//   print(civil.hashCode);     /// 962034568
//   print(civil.runtimeType);    /// Department
//   print(civil.toString());     /// Department.civil
//   print(civil.name);     /// Civil
//   print(Department.parse('Civil'));      /// Department.civil
// }

// @immutable
// class DepartmentStrings {
//   static const allDepartments = 'All Departments';
//   static const civil = 'Civil';
//   static const electrical = 'Electricald';
//   static const hse = 'HSE';
//   static const piping = 'Piping';
//   static const inspection = 'Inspection';
//   static const infoTech = 'IT';
//   static const operation = 'Operation';
//   static const instrument = 'Instrument';
//   static const machinery = 'Machinery';

//   const DepartmentStrings._();
// }

// enum Department {
//   allDepartments,
//   civil,
//   electrical,
//   hse,
//   piping,
//   inspection,
//   infoTech,
//   operation,
//   instrument,
//   machinery;

//   String get name {
//     return const {
//       Department.allDepartments: DepartmentStrings.allDepartments,
//       Department.civil: DepartmentStrings.civil,
//       Department.electrical: DepartmentStrings.electrical,
//       Department.hse: DepartmentStrings.hse,
//       Department.piping: DepartmentStrings.piping,
//       Department.inspection: DepartmentStrings.inspection,
//       Department.infoTech: DepartmentStrings.infoTech,
//       Department.operation: DepartmentStrings.operation,
//       Department.instrument: DepartmentStrings.instrument,
//       Department.machinery: DepartmentStrings.machinery,
//     }[this]!;
//   }

//   static Department? parse(String name) {
//     return const {
//       DepartmentStrings.allDepartments: Department.allDepartments,
//       DepartmentStrings.civil: Department.civil,
//       DepartmentStrings.electrical: Department.electrical,
//       DepartmentStrings.hse: Department.hse,
//       DepartmentStrings.piping: Department.piping,
//       DepartmentStrings.inspection: Department.inspection,
//       DepartmentStrings.infoTech: Department.infoTech,
//       DepartmentStrings.operation: Department.operation,
//       DepartmentStrings.instrument: Department.instrument,
//       DepartmentStrings.machinery: Department.machinery,
//     }[name];
//   }
// }
