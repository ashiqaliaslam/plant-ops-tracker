import 'package:flutter/foundation.dart' show immutable;

@immutable
class InstructionKey {
  // static const id = 'instruction_id';
  static const userId = 'uid';
  static const title = 'instruction_title';
  static const description = 'instruction_description';
  // static const steps = 'instruction_steps';
  static const department = 'departments';
  static const createdAt = 'created_at';
  static const updatedAt = 'updated_at';
  static const instructionIssuer = 'instruction_issuer';
  static const priority = 'instruction_priority';
  static const isActive = 'is_active';

  const InstructionKey._();
}
