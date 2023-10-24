import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';
import 'package:plant_ops_tracker/state/instructions/providers/can_current_user_delete_instruciton_provider.dart';
import 'package:plant_ops_tracker/state/instructions/providers/delete_instruction_provider.dart';
import 'package:plant_ops_tracker/state/instructions/providers/specific_instruction_provider.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/date_time_view.dart';
import 'package:plant_ops_tracker/views/components/animations/loading_rounds.dart';
import 'package:plant_ops_tracker/views/components/animations/small_error_animation.dart';
import 'package:plant_ops_tracker/views/components/dialogs/alert_dialog_model.dart';
import 'package:plant_ops_tracker/views/components/dialogs/delete_dialog.dart';
import 'package:plant_ops_tracker/views/components/hight_of.dart';

class InstructionDetailsView extends ConsumerStatefulWidget {
  final Instruction instruction;
  const InstructionDetailsView({
    super.key,
    required this.instruction,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InstructionDetailsViewState();
}

class _InstructionDetailsViewState
    extends ConsumerState<InstructionDetailsView> {
  @override
  Widget build(BuildContext context) {
    // final request = RequestForInstruction(
    //   instructionId: widget.instruction.instructionId,
    //   sortByCreatedAt: true,
    // );
    final instructionId = widget.instruction.instructionId;

    // get the actual instruction
    final thisInstruction =
        ref.watch(specificInstructionProvider(instructionId));

    // can we delete this instruction?
    final canDeleteInstruction =
        ref.watch(canCurrentUserDeleteInstructionProvider(widget.instruction));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Standing Order Detail'),
        actions: [
          if (canDeleteInstruction.value ?? false)
            IconButton(
              onPressed: () async {
                final shouldDeleteInstruction =
                    await DeleteDialog(titleOfObjectToDelete: 'Standing Order')
                        .present(context)
                        .then((shouldDelete) => shouldDelete ?? false);
                if (shouldDeleteInstruction) {
                  await ref
                      .read(deleteInstructionProvider.notifier)
                      .deleteInstruction(instructionId: instructionId);
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
              icon: const Icon(Icons.delete),
            )
        ],
      ),
      body: thisInstruction.when(
        data: (thisInstruction) {
          final isActive = thisInstruction.isActive;
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    isActive ? Icons.check : Icons.cancel,
                    color: isActive ? Colors.green : Colors.red,
                  ),
                  Text(
                    thisInstruction.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const HightOf(),
                  Text(thisInstruction.description ?? ''),
                  const HightOf(),
                  ListTile(
                    title: const Text('Instruction Issuer'),
                    subtitle:
                        Text(thisInstruction.instructionIssuer?.name ?? ''),
                  ),
                  const HightOf(),
                  ListTile(
                    title: const Text('Department'),
                    subtitle: Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: thisInstruction.department
                          .map((department) =>
                              Chip(label: Text(department?.name ?? '')))
                          .toList(),
                    ),
                  ),
                  const HightOf(),
                  ListTile(
                    title: const Text('Priority'),
                    subtitle: Wrap(
                      children: [
                        Chip(label: Text(thisInstruction.priority?.name ?? ''))
                      ],
                    ),
                  ),
                  const HightOf(),
                  const HightOf(),
                  Text('Steps',
                      style: Theme.of(context).textTheme.headlineSmall),
                  for (var step in thisInstruction.steps)
                    Card(
                      elevation: 4,
                      // color: Colors.lightBlueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(step ?? ''),
                      ),
                    ),
                  const HightOf(),
                  ListTile(
                    title: const Text('Created At'),
                    subtitle: thisInstruction.createdAt != null
                        ? DateTimeView(dateTime: thisInstruction.createdAt!)
                        : Container(),
                  )
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return const SmallErrorAnimationView();
        },
        loading: () {
          return const LoadingRoundsView();
        },
      ),
    );
  }
}
