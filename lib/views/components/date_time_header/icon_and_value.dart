import 'package:flutter/material.dart';

class IconAndValue extends StatelessWidget {
  const IconAndValue({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 6),
        Text(title, style: TextStyle(color: color)),
      ],
    );
  }
}
