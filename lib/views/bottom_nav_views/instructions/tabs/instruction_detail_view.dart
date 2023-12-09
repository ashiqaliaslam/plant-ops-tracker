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
import 'package:plant_ops_tracker/views/create/create_instructions/edit_instruction.dart';

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
    final instructionId = widget.instruction.instructionId;

    // get the actual instruction
    final thisInstruction =
        ref.watch(specificInstructionProvider(instructionId));

    // can we delete this instruction?
    final canDeleteInstruction =
        ref.watch(canCurrentUserDeleteInstructionProvider(widget.instruction));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Standing Order'),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Instruction by'),
                      Text(
                        thisInstruction.instructionIssuer?.name ?? '',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const HightOf(),
                  Row(
                    children: [
                      const Text('Priority: '),
                      const SizedBox(width: 5),
                      Text(
                        thisInstruction.priority?.name ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _getPriorityColor(
                            thisInstruction.priority?.name,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text('Status: '),
                      const SizedBox(width: 5),
                      Text(
                        isActive ? 'Active' : 'Inactive',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: isActive ? Colors.green : Colors.red,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        isActive ? Icons.check_circle : Icons.cancel,
                        color: isActive ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                  // ListTile(
                  //   title: const Text('Priority'),
                  //   subtitle: Wrap(
                  //     children: [
                  //       Chip(label: Text(thisInstruction.priority?.name ?? ''))
                  //     ],
                  //   ),
                  // ),
                  // ListTile(
                  //   title: const Text('Instruction by'),
                  //   subtitle: Text(
                  //     thisInstruction.instructionIssuer?.name ?? '',
                  //   ),
                  // ),
                  const HightOf(),
                  Card(
                    margin: const EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Row(
                          //   children: [
                          //     // Icon(Icons.integration_instructions),
                          //     // SizedBox(width: 8),
                          //     // Text('Title'),
                          //   ],
                          // ),
                          // const HightOf(5),
                          Text(
                            thisInstruction.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                          const Divider(),
                          Text(
                            thisInstruction.description ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const HightOf(),
                  ListTile(
                    title: const Text('Department'),
                    subtitle: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: thisInstruction.department
                          .map((department) =>
                              Chip(label: Text(department?.name ?? '')))
                          .toList(),
                    ),
                  ),
                  const HightOf(),

                  const HightOf(),
                  ListTile(
                      title: const Text('Created At'),
                      subtitle:
                          // thisInstruction.createdAt != null
                          // ?
                          DateTimeView(dateTime: thisInstruction.createdAt)
                      // : Container(),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditInstructionView(
                instruction: widget.instruction,
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getPriorityColor(String? priorityName) {
    switch (priorityName) {
      case 'Low':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'High':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  // Color _getStatusColor(String? activeStatus) {
  //   switch (activeStatus) {
  //     case 'Inactive':
  //       return Colors.red;
  //     case 'Active':
  //       return Colors.green;
  //     default:
  //       return Colors.black;
  //   }
  // }
}
