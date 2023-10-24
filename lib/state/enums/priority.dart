///```dart
/// Priority.high => // Priority.high
/// Priority.high.index => // 0
/// Priority.high.hashCode => // 803563740
/// Priority.high.runtimeType => // Priority
/// Priority.high.toString() => // Priority.high
/// Priority.values.first => // Priority.high
/// Priority.values.firstWhere((dep) => dep.name.toString().toLowerCase() == 'high')  => // Priority.high
///```

enum PriorityLevel {
  high,
  medium,
  low;

  static const Map<PriorityLevel, String> _nameMap = {
    PriorityLevel.high: 'High',
    PriorityLevel.medium: 'Medium',
    PriorityLevel.low: 'Low',
  };

  ///```dart
  /// Priority.high.name => // High
  ///```
  String get name => _nameMap[this]!;

  ///```dart
  /// Priority.parse('high') => // Priority.high
  /// Priority.parse('high') as Priority => // Priority.high
  ///```
  static PriorityLevel? parse(String name) {
    final matchingEntry = PriorityLevel.values.firstWhere(
      (priority) =>
          priority.toString().split('.').last.toLowerCase() ==
          name.toLowerCase(),
      orElse: () => PriorityLevel.medium,
    );
    return matchingEntry;
  }
}
