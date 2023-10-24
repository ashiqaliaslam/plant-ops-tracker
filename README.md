# plant_ops_tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```dart
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum Priority {
  high,
  medium,
  low;

  static const Map<Priority, String> _nameMap = {
    Priority.high: 'High',
    Priority.medium: 'Medium',
    Priority.low: 'Low',
  };

  String get name => _nameMap[this]!;

  static Priority? parse(String name) {
    final matchingEntry = Priority.values.firstWhere(
      (priority) =>
          priority.toString().split('.').last.toLowerCase() ==
          name.toLowerCase(),
      orElse: () => Priority.medium,
    );
    return matchingEntry;
  }
}



void enumResults(String enumName, dynamic value, Function(String) parse) {
  print('///```dart');
  print('/// $enumName.${value.toString().split('.').last} => // $enumName.${value.toString().split('.').last}');
  print('/// $enumName.${value.toString().split('.').last}.index => // ${value.index}');
  print('/// $enumName.${value.toString().split('.').last}.hashCode => // ${value.hashCode}');
  print('/// $enumName.${value.toString().split('.').last}.runtimeType => // ${value.runtimeType}');
  print('/// $enumName.${value.toString().split('.').last}.toString() => // ${value.toString()}');
  print('///```');
  print('');
  print('///```dart');
  print('/// $enumName.${value.toString().split('.').last}.name => // ${value.name}');
  print('///```');
  print('');
  print('///```dart');
  print('/// $enumName.parse(\'${value.toString().split('.').last}\') => // ${parse('high')}');
  print('/// $enumName.parse(\'${value.toString().split('.').last}\') as $enumName => // ${parse('high')}');
  print('///```');

}

void main() {

 enumResults('Priority', Priority.high, Priority.parse);




  /// Priority.hse
  print(Priority.values.first);

  /// Priority.shiftEngineer
  print(Priority.values
      .firstWhere((dep) => dep.name.toString().toLowerCase() == 'high'));

  /// Priority.inspection
}

```
