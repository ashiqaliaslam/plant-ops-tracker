import 'package:flutter/material.dart';

class ActiveToggleSwitch extends StatefulWidget {
  const ActiveToggleSwitch({
    super.key,
    required this.isActive,
    required this.onSwitchChanged,
  });

  final bool isActive;
  final ValueChanged<bool> onSwitchChanged;

  @override
  State<ActiveToggleSwitch> createState() => _ActiveToggleSwitchState();
}

class _ActiveToggleSwitchState extends State<ActiveToggleSwitch> {
  bool isActive = true;

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            isActive ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Switch(
          value: isActive,
          onChanged: (value) {
            setState(() {
              isActive = value;
            });
            widget.onSwitchChanged(isActive);
          },
        ),
      ],
    );
  }
}
