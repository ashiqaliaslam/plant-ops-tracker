import 'package:flutter/material.dart';

class Destination {
  final int index;
  final String label;
  final Widget selectedIcon;
  final Widget icon;
  final MaterialColor? color;

  Destination({
    required this.index,
    required this.label,
    required this.selectedIcon,
    required this.icon,
    this.color,
  });
}

@immutable
class DestinationList {
  static List<Destination> allDestinations = [
    Destination(
      index: 0,
      label: 'Audits',
      selectedIcon: const Icon(Icons.task),
      icon: const Icon(Icons.task_outlined),
    ),
    Destination(
      index: 1,
      label: 'Talks',
      selectedIcon: const Icon(Icons.health_and_safety),
      icon: const Icon(Icons.health_and_safety_outlined),
    ),
    Destination(
      index: 2,
      label: 'Changeovers',
      selectedIcon: const Icon(Icons.change_circle),
      icon: const Icon(Icons.change_circle_outlined),
    ),
    Destination(
      index: 3,
      label: 'Instructions',
      selectedIcon: const Icon(Icons.tips_and_updates),
      icon: const Icon(Icons.tips_and_updates_outlined),
    ),
  ];
}
