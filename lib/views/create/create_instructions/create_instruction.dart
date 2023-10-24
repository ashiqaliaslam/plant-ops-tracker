import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/providers/user_id_provider.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';
import 'package:plant_ops_tracker/state/enums/instruction_issuer.dart';
import 'package:plant_ops_tracker/state/enums/priority.dart';
import 'package:plant_ops_tracker/state/instructions/providers/create_instruction_provider.dart';
import 'package:plant_ops_tracker/views/components/hight_of.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';

import 'components/index_create_components.dart';

class CreateInstructionView extends StatefulHookConsumerWidget {
  const CreateInstructionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateInstructionViewState();
}

class _CreateInstructionViewState extends ConsumerState<CreateInstructionView> {
  @override
  Widget build(BuildContext context) {
    // Initialize a state variable 'selectedPriority' with the useState hook.
    // The useState hook returns a stateful value that can be read
    // (selectedPriority.value) and written (selectedPriority.value = newValue).
    final priorityController = useTextEditingController();
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final instructionIssuerController = useTextEditingController();
    final departmentsList = useState<List<Department>>([]);
    final isActive = useState(true);
    final stepsList = useState<List<String>>([]);

    final isButtonEnabled = useState(false);

    useEffect(() {
      void listener() {
        isButtonEnabled.value = titleController.text.isNotEmpty &&
                descriptionController.text.isNotEmpty &&
                departmentsList.value.isNotEmpty &&
                priorityController.text.isNotEmpty
            // commentsff
            ;
      }

      titleController.addListener(listener);
      descriptionController.addListener(listener);
      instructionIssuerController.addListener(listener);
      priorityController.addListener(listener);
      departmentsList.addListener(listener); // yes or no ??

      return () {
        titleController.removeListener(listener);
        descriptionController.removeListener(listener);
        instructionIssuerController.removeListener(listener);
        priorityController.removeListener(listener);
        departmentsList.removeListener(listener); // yes or no ??
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createInstruction),
        actions: [
          IconButton(
            onPressed: isButtonEnabled.value
                ? () async {
                    final title = titleController.text;
                    final description = descriptionController.text;
                    final instructionIssuer = InstructionIssuer.parse(
                        instructionIssuerController.text);
                    final priority =
                        PriorityLevel.parse(priorityController.text);

                    final userId = ref.read(userIdProvider);

                    if (userId == null) {
                      return;
                    }
                    final isCreated = await ref
                        .read(createInstructionProvider.notifier)
                        .createInstruction(
                          userId: userId,
                          title: title,
                          description: description,
                          department: departmentsList.value,
                          instructionIssuer: instructionIssuer,
                          priority: priority,
                          isActive: isActive.value,
                          steps: stepsList.value,
                        );
                    if (isCreated && mounted) {
                      Navigator.pop(context);
                    }
                  }
                : null,
            icon: const Icon(Icons.send),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            children: [
              TitleField(titleController: titleController),
              const HightOf(),
              DescriptionField(descriptionController: descriptionController),
              InstructionIssuerDropdown(
                instructionIssuerController: instructionIssuerController,
              ),
              const HightOf(),
              // StepsReorderableList(stepsList: stepsList.value),
              // StepsReorderableListView(stepsList: stepsList.value),
              StepsListView(stepsList: stepsList.value),
              const HightOf(10),
              // AddStepButton(
              //   onPressed: () {
              //     stepsList.value = List.from(stepsList.value)..add('');
              //   },
              // ),
              AddStepButton(
                onPressed: () async {
                  final newSteps = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddStepsView(initialSteps: stepsList.value),
                    ),
                  );
                  if (newSteps != null) {
                    stepsList.value = newSteps;
                  }
                },
              ),
              // AddStepButton(
              //   onPressed: () async {
              //     final newSteps =
              //         await context.go('/add-steps', stepsList.value);
              //     if (newSteps != null) {
              //       stepsList.value = newSteps;
              //     }
              //   },
              // ),

              const HightOf(),
              PrioritySelectionContainer(
                priorityController: priorityController,
              ),
              const HightOf(),
              DepartmentSelection(
                initialSelectedDepartments: departmentsList.value,
                onDepartmentSelected: (newDepartmentsList) =>
                    departmentsList.value = newDepartmentsList,
              ),
              const HightOf(),
              ActiveToggleSwitch(
                isActive: isActive.value,
                onSwitchChanged: (newIsActive) => isActive.value = newIsActive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
