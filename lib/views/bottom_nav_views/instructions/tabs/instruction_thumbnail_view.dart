import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';
import 'package:plant_ops_tracker/state/instructions/providers/delete_instruction_provider.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/date_view.dart';
import 'package:plant_ops_tracker/views/components/dialogs/alert_dialog_model.dart';
import 'package:plant_ops_tracker/views/components/dialogs/delete_dialog.dart';
import 'package:plant_ops_tracker/views/components/hight_of.dart';
import 'package:plant_ops_tracker/views/create/create_instructions/edit_instruction.dart';

class InstructionThumbnailView extends ConsumerWidget {
  final Instruction instruction;
  final VoidCallback onTapped;

  const InstructionThumbnailView({
    super.key,
    required this.instruction,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final double left = 4.0;
    // final canDeleteInstruction =
    //     ref.watch(canCurrentUserDeleteInstructionProvider(instruction));

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      // elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),

      child: InkWell(
        onTap: onTapped,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        color: Colors.white.withAlpha(100),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          child: Text(
                            instruction.instructionIssuer?.name ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),

                      // if (canDeleteInstruction.value ?? false)
                      const Spacer(),
                      PopupMenuButton(
                        icon: const Icon(Icons.more_horiz),
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(Icons.delete, color: Colors.red),
                                  SizedBox(width: 3),
                                  Text('Delete'),
                                  // IconButton(onPressed: onPressed, icon: icon)
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 2,
                              child: Row(
                                children: [
                                  Icon(Icons.edit, color: Colors.blue),
                                  SizedBox(width: 3),
                                  Text('Edit'),
                                ],
                              ),
                            )
                          ];
                        },
                        onSelected: (value) async {
                          if (value == 1) {
                            final shouldDeleteInstruction = await DeleteDialog(
                                    titleOfObjectToDelete: 'Standing Order')
                                .present(context)
                                .then((shouldDelete) => shouldDelete ?? false);
                            if (shouldDeleteInstruction) {
                              await ref
                                  .read(deleteInstructionProvider.notifier)
                                  .deleteInstruction(
                                      instructionId: instruction.instructionId);
                              // if (mounted) {
                              //   Navigator.of(context).pop();
                              // }
                            }
                          } else if (value == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditInstructionView(
                                  instruction: instruction,
                                ),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                  Text(
                    instruction.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const HightOf(),
                  const Divider(),
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            // runSpacing: 4.0, // gap between lines
                            children: instruction.department
                                .map(
                                  (department) => Card(
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    color: Colors.orangeAccent.withAlpha(100),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      child: Text(department?.name ?? ''),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const Spacer(),
                      DateView(dateTime: instruction.createdAt),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: -16,
                left: -16,
                child: Icon(
                  instruction.isActive ? Icons.check_circle : Icons.cancel,
                  color: instruction.isActive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
