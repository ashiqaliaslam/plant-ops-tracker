import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/providers/user_id_provider.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';
import 'package:plant_ops_tracker/state/enums/instruction_issuer.dart';
import 'package:plant_ops_tracker/state/enums/priority.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';
import 'package:plant_ops_tracker/state/instructions/providers/create_instruction_provider.dart';
import 'package:plant_ops_tracker/views/components/hight_of.dart';
import 'package:plant_ops_tracker/views/create/create_instructions/components/active_toggle_button.dart';
import 'package:plant_ops_tracker/views/create/create_instructions/components/department_selection.dart';
import 'package:plant_ops_tracker/views/create/create_instructions/components/description_field.dart';
import 'package:plant_ops_tracker/views/create/create_instructions/components/instruction_issuer_dropdown.dart';
import 'package:plant_ops_tracker/views/create/create_instructions/components/priority_selection.dart';
import 'package:plant_ops_tracker/views/create/create_instructions/components/title_field.dart';

class EditInstructionView extends StatefulHookConsumerWidget {
  final Instruction instruction;

  const EditInstructionView({
    super.key,
    required this.instruction,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditInstructionViewState();
}

class _EditInstructionViewState extends ConsumerState<EditInstructionView> {
  @override
  Widget build(BuildContext context) {
    final priorityController =
        useTextEditingController(text: widget.instruction.priority.toString());
    final titleController =
        useTextEditingController(text: widget.instruction.title);
    final descriptionController =
        useTextEditingController(text: widget.instruction.description);
    final instructionIssuerController = useTextEditingController(
        text: widget.instruction.instructionIssuer.toString());
    final departmentsList = useState<List<Department>>(
        widget.instruction.department.whereType<Department>().toList());
    final isActive = useState(widget.instruction.isActive);

    final isButtonEnabled = useState(true);

    useEffect(() {
      void listener() {
        isButtonEnabled.value = titleController.text.isNotEmpty &&
                descriptionController.text.isNotEmpty &&
                departmentsList.value.isNotEmpty &&
                priorityController.text.isNotEmpty
            // add more if necessary
            ;
      }

      titleController.addListener(listener);
      descriptionController.addListener(listener);
      instructionIssuerController.addListener(listener);
      priorityController.addListener(listener);
      departmentsList.addListener(listener);

      return () {
        titleController.removeListener(listener);
        descriptionController.removeListener(listener);
        instructionIssuerController.removeListener(listener);
        priorityController.removeListener(listener);
        departmentsList.removeListener(listener);
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Standing Order'),
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
                    // final isUpdated = await
                    ref
                        .read(createInstructionProvider.notifier)
                        .updateInstruction(
                          instructionId: widget.instruction.instructionId,
                          userId: userId,
                          title: title,
                          description: description,
                          department: departmentsList.value,
                          instructionIssuer: instructionIssuer,
                          priority: priority,
                          isActive: isActive.value,
                        );
                    // if (isUpdated && mounted) {
                    if (mounted) {
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
                initialInstructionIssuer: widget.instruction.instructionIssuer,
              ),
              const HightOf(),
              const HightOf(),
              PrioritySelectionContainer(
                priorityController: priorityController,
                initialPriority: widget.instruction.priority,
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
