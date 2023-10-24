// ignore_for_file: avoid_print

import 'package:plant_ops_tracker/extensions/log.dart';

///```dart
///  print(InstructionIssuer.shiftEngineer);   /// InstructionIssuer.shiftEngineer
///  print(InstructionIssuer.shiftEngineer.index);   /// 0
///  print(InstructionIssuer.shiftEngineer.hashCode);   /// 927867746
///  print(InstructionIssuer.shiftEngineer.runtimeType);   /// InstructionIssuer
///  print(InstructionIssuer.shiftEngineer.toString());   /// InstructionIssuer.shiftEngineer
///```
enum InstructionIssuer {
  shiftEngineer,
  dayEngineer,
  sectionHead,
  unitManager,
  productionManager,
  sop, // based on Standing Operating Procedures
  ;

  static const Map<InstructionIssuer, String> _nameMap = {
    InstructionIssuer.shiftEngineer: 'Shift Engineer',
    InstructionIssuer.dayEngineer: 'Day Engineer',
    InstructionIssuer.sectionHead: 'Section Head',
    InstructionIssuer.unitManager: 'Unit Manager',
    InstructionIssuer.productionManager: 'Production Manager',
    InstructionIssuer.sop: 'SOP',
  };

  /// `name` getter is used to get the pretty string
  ///```dart
  ///  print(InstructionIssuer.shiftEngineer.name);    /// Shift Engineer
  /// ```

  String get name => _nameMap[this]!;

  ///```dart
  /// print(InstructionIssuer.parse('shiftengineer'));   ///InstructionIssuer.shiftEngineer
  /// print(InstructionIssuer.parse('Shiftengineer') as InstructionIssuer);   /// InstructionIssuer.shiftEngineer
  /// print(InstructionIssuer.values.first);   /// InstructionIssuer.shiftEngineer
  /// print(InstructionIssuer.values.firstWhere((dep) => dep.name.toString().toLowerCase() == 'unit manager'));    /// InstructionIssuer.unitManager
  /// print(InstructionIssuer.parse('sectionhead'));  // InstructionIssuer.sectionHead
  /// ```

  static InstructionIssuer? parse(String name) {
    'Parsing Manager name: $name'.log();
    final matchingEntry = InstructionIssuer.values.firstWhere(
      (instructionIssuer) =>
          instructionIssuer.toString().split('.').last.toLowerCase() ==
          name.toLowerCase(),
      orElse: () => InstructionIssuer.sop,
    );
    'Matcherd Manager name ${matchingEntry.name}'.log();
    return matchingEntry;
  }
}
