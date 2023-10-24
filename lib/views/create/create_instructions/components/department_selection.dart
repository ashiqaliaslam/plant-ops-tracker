import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';

class DepartmentSelection extends HookConsumerWidget {
  final List<Department> initialSelectedDepartments;
  final ValueChanged<List<Department>> onDepartmentSelected;

  const DepartmentSelection({
    super.key,
    required this.initialSelectedDepartments,
    required this.onDepartmentSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDepartments = useState(initialSelectedDepartments);

    useEffect(() {
      void listener() {
        onDepartmentSelected(selectedDepartments.value);
      }

      selectedDepartments.addListener(listener);
      return () {
        selectedDepartments.removeListener(listener);
      };
    });

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: const Text('Select Departments'),
                        content: SingleChildScrollView(
                          child: Wrap(
                            spacing: 5,
                            children: Department.values.map((department) {
                              return ChoiceChip.elevated(
                                label: Text(department.name),
                                selected: selectedDepartments.value
                                    .contains(department),
                                onSelected: (isSelected) {
                                  setState(() {
                                    if (isSelected) {
                                      selectedDepartments.value = {
                                        ...selectedDepartments.value,
                                        department
                                      }.toList();
                                    } else {
                                      selectedDepartments.value = {
                                        ...selectedDepartments.value
                                          ..remove(department)
                                      }.toList();
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
            child: const Text('Select Departments'),
          ),
          Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            children: selectedDepartments.value.map((department) {
              return InputChip(
                label: Text(department.name),
                onDeleted: () {
                  selectedDepartments.value = {
                    ...selectedDepartments.value..remove(department)
                  }.toList();
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
