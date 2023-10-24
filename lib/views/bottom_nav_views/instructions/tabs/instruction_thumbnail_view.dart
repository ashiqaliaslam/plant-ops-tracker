import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';
import 'package:plant_ops_tracker/state/instructions/providers/delete_instruction_provider.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/date_view.dart';
import 'package:plant_ops_tracker/views/components/dialogs/alert_dialog_model.dart';
import 'package:plant_ops_tracker/views/components/dialogs/delete_dialog.dart';
import 'package:plant_ops_tracker/views/components/hight_of.dart';

// class InstructionThumbnailView extends ConsumerStatefulWidget {
//   final Instruction instruction;
//   final VoidCallback onTapped;
//   const InstructionThumbnailView({
//     super.key,
//     required this.instruction,
//     required this.onTapped,
//   });

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _InstructionThumbnailViewState();
// }

// class _InstructionThumbnailViewState
//     extends ConsumerState<InstructionThumbnailView> {
//   @override
//   Widget build(BuildContext context) {
//     final canDeleteInstruction =
//         ref.watch(canCurrentUserDeleteInstructionProvider(widget.instruction));
//     return GestureDetector(
//       onTap: widget.onTapped,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//         // elevation: 4,
//         margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.instruction.title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   if (canDeleteInstruction.value ?? false)
//                     PopupMenuButton(
//                       icon: const Icon(Icons.more_horiz),
//                       itemBuilder: (context) {
//                         return [
//                           const PopupMenuItem(
//                             value: 1,
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.delete,
//                                   color: Colors.red,
//                                 ),
//                                 SizedBox(width: 1),
//                                 Text('Delete'),
//                               ],
//                             ),
//                           )
//                         ];
//                       },
//                       onSelected: (value) async {
//                         if (value == 1) {
//                           final shouldDeleteInstruction = await DeleteDialog(
//                                   titleOfObjectToDelete: 'Standing Order')
//                               .present(context)
//                               .then((shouldDelete) => shouldDelete ?? false);
//                           if (shouldDeleteInstruction) {
//                             await ref
//                                 .read(deleteInstructionProvider.notifier)
//                                 .deleteInstruction(
//                                     instructionId:
//                                         widget.instruction.instructionId);
//                             // if (mounted) {
//                             //   Navigator.of(context).pop();
//                             // }
//                           }
//                         }
//                       },
//                     )
//                   // IconButton(
//                   //   icon: const Icon(Icons.more_horiz),
//                   //   onPressed: () {
//                   //     showDialog(
//                   //       context: context,
//                   //       builder: (context) {
//                   //         return AlertDialog(
//                   //           title: Text('Delete Instruction'),
//                   //           content: Text('Are you sure?'),
//                   //           actions: [
//                   //             TextButton(
//                   //               onPressed: () {},
//                   //               child: Text('Delete'),
//                   //             )
//                   //           ],
//                   //         );
//                   //       },
//                   //     );
//                   //   },
//                   // )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 1),
                                  Text('Delete'),
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
                      DateView(dateTime: instruction.createdAt!),
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

// ListTile(
//   contentPadding: const EdgeInsets.all(8),
//   horizontalTitleGap: 20,
//   title: Container(
//     padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
//     child: Text(
//       instruction.title,
//       style: Theme.of(context).textTheme.labelLarge,
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     ),
//   ),
//   subtitle: Text(
//     instruction.description ?? '',
//     style: Theme.of(context).textTheme.bodyMedium,
//     maxLines: 3,
//     overflow: TextOverflow.ellipsis,
//   ),
// ),

// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         instruction.title,
//         style: Theme.of(context).textTheme.labelLarge,
//         maxLines: 2,
//         overflow: TextOverflow.ellipsis,

//       ),
//       const HightOf(8),
//       Text(
//         instruction.description ?? '',
//         style: Theme.of(context).textTheme.bodyMedium,
//         maxLines: 3,
//         overflow: TextOverflow.ellipsis,
//       ),
//     ],
//   ),
// ),
