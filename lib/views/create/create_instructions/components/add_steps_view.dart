import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/extensions/log.dart';

class AddStepsView extends StatefulWidget {
  final List<String> initialSteps;

  const AddStepsView({
    super.key,
    required this.initialSteps,
  });

  @override
  State<AddStepsView> createState() => _AddStepsViewState();
}

class _AddStepsViewState extends State<AddStepsView> {
  late List<String> steps;

  @override
  void initState() {
    super.initState();
    steps = List<String>.from(widget.initialSteps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Steps'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              final stepsWithText =
                  steps.where((step) => step.isNotEmpty).toList();
              Navigator.pop(context, stepsWithText);
            },
          ),
        ],
      ),
      body: ReorderableListView.builder(
        itemCount: steps.length,
        itemBuilder: (BuildContext context, int index) {
          final controller = TextEditingController(text: steps[index]);
          return ListTile(
            key: Key('step_$index'),
            leading: ReorderableDragStartListener(
              index: index,
              child: const Icon(Icons.reorder),
            ),
            title: TextFormField(
              controller: controller,
              maxLines: null,
              minLines: 1,
              onChanged: (value) {
                steps[index] = value;
              },
              decoration: InputDecoration(
                hintText: 'step_$index',
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  steps.removeAt(index);
                });
              },
            ),
          );
        },
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) newIndex--;

          final String step = steps.removeAt(oldIndex);
          'Removed step at oldIndex $oldIndex'.log();
          steps.insert(newIndex, step);
          'Inserted step at newIndex $newIndex'.log();

          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            steps.add('');
          });
        },
      ),
    );
  }
}
