import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:plant_ops_tracker/state/auth/providers/user_id_provider.dart';
import 'package:plant_ops_tracker/state/enums/department.dart';
import 'package:plant_ops_tracker/state/enums/instruction_issuer.dart';
import 'package:plant_ops_tracker/state/instructions/providers/create_instruction_provider.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';

class CreateInstructionView extends StatefulHookConsumerWidget {
  const CreateInstructionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateInstructionViewState();
}

class _CreateInstructionViewState extends ConsumerState<CreateInstructionView> {
  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final instructionIssuerController = useTextEditingController();
    final departmentsList = useState<List<Department>>([]);

    final isButtonEnabled = useState(false);

    useEffect(() {
      void listener() {
        isButtonEnabled.value = titleController.text.isNotEmpty &&
            descriptionController.text.isNotEmpty &&
            departmentsList.value.isNotEmpty;
      }

      titleController.addListener(listener);
      descriptionController.addListener(listener);
      instructionIssuerController.addListener(listener);
      departmentsList.addListener(listener); // yes or no ??
      return () {
        titleController.removeListener(listener);
        descriptionController.removeListener(listener);
        instructionIssuerController.removeListener(listener);
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
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: titleController,
              autofocus: true,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: Strings.title,
                hintText: Strings.titleOfInstruction,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: descriptionController,
              autofocus: true,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: Strings.description,
                hintText: Strings.descriptionOfInstruction,
              ),
            ),
          ),

          // dropdown field, and then add the fields in the List<Department?> departments
          // on submit. also ensure that if empty field it can not be submitted
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField<InstructionIssuer>(
              decoration: const InputDecoration(
                labelText: 'Instruction Issuer',
                hintText: 'Select Instruction Issuer',
              ),
              items: InstructionIssuer.values.map((issuer) {
                return DropdownMenuItem<InstructionIssuer>(
                  value: issuer,
                  child: Text(issuer.name),
                );
              }).toList(),
              onChanged: (issuer) {
                setState(() {
                  instructionIssuerController.text =
                      issuer.toString().split('.').last;
                });
              },
            ),
          ),
          MultiSelectDialogField<Department>(
            items: Department.values
                .map((depart) =>
                    MultiSelectItem<Department>(depart, depart.name))
                .toList(),
            onConfirm: (values) {
              departmentsList.value = values;
            },
          ),
        ],
      )),
    );
  }
}
