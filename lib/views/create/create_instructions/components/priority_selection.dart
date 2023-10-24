import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plant_ops_tracker/state/enums/priority.dart';
import 'package:plant_ops_tracker/views/components/hight_of.dart';

class PrioritySelectionContainer extends HookWidget {
  final TextEditingController priorityController;

  const PrioritySelectionContainer({
    super.key,
    required this.priorityController,
  });

  @override
  Widget build(BuildContext context) {
    final selectedPriority = useState<PriorityLevel?>(null);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select Priority',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const HightOf(),
          Wrap(
            spacing: 5,
            children: PriorityLevel.values.map(
              (priority) {
                return ChoiceChip.elevated(
                  label: Text(priority.name),
                  selected: selectedPriority.value == priority,
                  onSelected: (isSelected) {
                    if (isSelected) {
                      selectedPriority.value = priority;
                      priorityController.text =
                          priority.toString().split('.').last;
                    } else if (selectedPriority.value == priority) {
                      selectedPriority.value = null;
                      priorityController.text = '';
                    }
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
