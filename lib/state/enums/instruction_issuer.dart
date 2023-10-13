import 'package:plant_ops_tracker/extensions/log.dart';

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

  String get name => _nameMap[this]!;

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
