import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/extensions/log.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';
import 'package:plant_ops_tracker/state/instructions/providers/all_instructions_provider.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/tabs/instruction_detail_view.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/tabs/instruction_thumbnail_view.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/tabs/search_bar.dart';
import 'package:plant_ops_tracker/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:plant_ops_tracker/views/components/animations/error_animation_view.dart';
import 'package:plant_ops_tracker/views/components/animations/loading_animation_view.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';

class InstructionsListView extends StatefulHookConsumerWidget {
  const InstructionsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InstructionsListViewState();
}

class _InstructionsListViewState extends ConsumerState<InstructionsListView> {
  @override
  Widget build(BuildContext context) {
    final instructions = ref.watch(allInstructionsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        'refresh started'.log();
        return await ref.refresh(allInstructionsProvider.future);
      },
      child: instructions.when(
        data: (instructions) {
          final instructionList = instructions.toList();
          final filteredInstructions =
              useState<List<Instruction>>(instructionList);

          if (instructions.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
                text: Strings.noInstruction);
          } else {
            return Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InstructionSearchBar(
                      instructionList: instructionList,
                      filteredInstructions: filteredInstructions,
                      onInstructionSelected: (selectedInstructions) {
                        setState(() {
                          filteredInstructions.value = selectedInstructions;
                        });
                      },
                    ),
                    // child: SearchAnchor(
                    //   builder: (context, searchController) {
                    //     return SearchBar(
                    //       controller: searchController,
                    //       // onTap: () {
                    //       //   searchController.openView();
                    //       // },
                    //       onChanged: (value) {
                    //         final lowerCaseValue = value.trim().toLowerCase();
                    //         if (lowerCaseValue.isEmpty) {
                    //           filteredInstructions.value = instructionList;
                    //         } else {
                    //           filteredInstructions.value =
                    //               instructions.where((instruction) {
                    //             return instruction.title
                    //                     .toLowerCase()
                    //                     .contains(lowerCaseValue) ||
                    //                 instruction.description!
                    //                     .toLowerCase()
                    //                     .contains(lowerCaseValue) ||
                    //                 instruction.instructionIssuer!.name
                    //                     .toLowerCase()
                    //                     .contains(lowerCaseValue) ||
                    //                 instruction.priority!.name
                    //                     .toLowerCase()
                    //                     .contains(lowerCaseValue) ||
                    //                 instruction.department.any((department) =>
                    //                     department!.name
                    //                         .toLowerCase()
                    //                         .contains(lowerCaseValue));
                    //           }).toList();
                    //         }
                    //       },
                    //       hintText: 'Search Standing Orders...',
                    //       leading: const Icon(Icons.search),
                    //       trailing: [
                    //         if (searchController.text.isNotEmpty)
                    //           IconButton(
                    //             icon: const Icon(Icons.clear),
                    //             onPressed: () {
                    //               searchController.clear();
                    //               filteredInstructions.value = instructionList;
                    //               //  dismissKeyboard();
                    //             },
                    //           ),
                    //       ],
                    //     );
                    //   },
                    //   suggestionsBuilder: (context, searchController) {
                    //     return List<ListTile>.generate(
                    //         filteredInstructions.value.length, (index) {
                    //       final instruction =
                    //           filteredInstructions.value.elementAt(index);
                    //       return ListTile(
                    //         title: Text(instruction.title),
                    //         onTap: () {
                    //           setState(() {
                    //             searchController.closeView(instruction.title);
                    //             // Update the filteredInstructions state directly
                    //             filteredInstructions.value = [instruction];
                    //           });
                    //         },
                    //       );
                    //     });
                    //   },
                    // ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredInstructions.value.length,
                      itemBuilder: (context, index) {
                        final instruction =
                            filteredInstructions.value.elementAt(index);

                        return InstructionThumbnailView(
                          instruction: instruction,
                          onTapped: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        InstructionDetailsView(
                                  instruction: instruction,
                                ),
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var begin = const Offset(3.0, 0.0);
                                  var end = Offset.zero;
                                  var tween = Tween(begin: begin, end: end);
                                  var offsetAnimation = animation.drive(tween);

                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}



// class InstructionsListView extends HookConsumerWidget {
//   const InstructionsListView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final instructions = ref.watch(allInstructionsProvider);
//     final searchController = useTextEditingController();

//     return RefreshIndicator(
//       onRefresh: () async {
//         'refresh started'.log();
//         return await ref.refresh(allInstructionsProvider.future);
//       },
//       child: instructions.when(
//         data: (instructions) {
//           final instructionList = instructions.toList();
//           final filteredInstructions =
//               useState<List<Instruction>>(instructionList);

//           if (instructions.isEmpty) {
//             return const EmptyContentsWithTextAnimationView(
//                 text: Strings.noInstruction);
//           } else {
//             return Scaffold(
//               body: Stack(
//                 children: [
//                   ListView.builder(
//                     itemCount: filteredInstructions.value.length,
//                     itemBuilder: (context, index) {
//                       final instruction =
//                           filteredInstructions.value.elementAt(index);

//                       return InstructionThumbnailView(
//                         instruction: instruction,
//                         onTapped: () {
//                           Navigator.push(
//                             context,
//                             PageRouteBuilder(
//                               pageBuilder:
//                                   (context, animation, secondaryAnimation) =>
//                                       InstructionDetailsView(
//                                 instruction: instruction,
//                               ),
//                               transitionDuration:
//                                   const Duration(milliseconds: 200),
//                               transitionsBuilder: (context, animation,
//                                   secondaryAnimation, child) {
//                                 var begin = const Offset(3.0, 0.0);
//                                 var end = Offset.zero;
//                                 var tween = Tween(begin: begin, end: end);
//                                 var offsetAnimation = animation.drive(tween);

//                                 return SlideTransition(
//                                   position: offsetAnimation,
//                                   child: child,
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SearchAnchor(
//                       builder: (context, controller) {
//                         return SearchBar(
//                           controller: searchController,
//                           // decoration: InputDecoration(
//                           //   hintText: 'Search Standing Orders...',
//                           //   // suffix: IconButton(
//                           //   //   icon: const Icon(Icons.clear),
//                           //   //   onPressed: () {
//                           //   //     searchController.clear();
//                           //   //     dismissKeyboard();
//                           //   //   },
//                           //   // ),
//                           //   border: OutlineInputBorder(
//                           //     borderRadius: BorderRadius.circular(30),
//                           //   ),
//                           //   filled: true,
//                           //   fillColor: Colors.grey.shade300,
//                           //   contentPadding:
//                           //       const EdgeInsets.symmetric(horizontal: 20),
//                           // ),

//                           onChanged: (value) {
//                             final lowerCaseValue = value.trim().toLowerCase();
//                             filteredInstructions.value =
//                                 instructions.where((instruction) {
//                               return instruction.title
//                                       .toLowerCase()
//                                       .contains(lowerCaseValue) ||
//                                   instruction.description!
//                                       .toLowerCase()
//                                       .contains(lowerCaseValue) ||
//                                   instruction.instructionIssuer!.name
//                                       .toLowerCase()
//                                       .contains(lowerCaseValue) ||
//                                   instruction.priority!.name
//                                       .toLowerCase()
//                                       .contains(lowerCaseValue) ||
//                                   instruction.department.any((department) =>
//                                       department!.name
//                                           .toLowerCase()
//                                           .contains(lowerCaseValue));
//                             }).toList();
//                           },
//                           leading: const Icon(Icons.search),
//                           trailing: [
//                             IconButton(
//                               icon: const Icon(Icons.clear),
//                               onPressed: () {
//                                 searchController.clear();
//                                 dismissKeyboard();
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                       suggestionsBuilder: (context, controller) {
//                         return List<ListTile>.generate(filteredInstructions.value.length, (index) {
//                           final instruction = filteredInstructions.value.elementAt(index);
//                           return ListTile(title: Text(instruction.title), onTap: () {
                            
//                           },)
//                         })
                        
//                       },
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: TextField(
//                   //     controller: searchController,
//                   //     decoration: InputDecoration(
//                   //       hintText: 'Search Standing Orders...',
//                   //       suffix: IconButton(
//                   //         icon: const Icon(Icons.clear),
//                   //         onPressed: () {
//                   //           searchController.clear();
//                   //           dismissKeyboard();
//                   //         },
//                   //       ),
//                   //       border: OutlineInputBorder(
//                   //         borderRadius: BorderRadius.circular(30),
//                   //       ),
//                   //       filled: true,
//                   //       fillColor: Colors.grey.shade300,
//                   //       contentPadding:
//                   //           const EdgeInsets.symmetric(horizontal: 20),
//                   //     ),
//                   //     onChanged: (value) {
//                   //       final lowerCaseValue = value.trim().toLowerCase();
//                   //       filteredInstructions.value =
//                   //           instructions.where((instruction) {
//                   //         return instruction.title
//                   //                 .toLowerCase()
//                   //                 .contains(lowerCaseValue) ||
//                   //             instruction.description!
//                   //                 .toLowerCase()
//                   //                 .contains(lowerCaseValue) ||
//                   //             instruction.instructionIssuer!.name
//                   //                 .toLowerCase()
//                   //                 .contains(lowerCaseValue) ||
//                   //             instruction.priority!.name
//                   //                 .toLowerCase()
//                   //                 .contains(lowerCaseValue) ||
//                   //             instruction.department.any((department) =>
//                   //                 department!.name
//                   //                     .toLowerCase()
//                   //                     .contains(lowerCaseValue));
//                   //       }).toList();
//                   //       // Update your UI with the filteredInstructions
//                   //     },
//                   //   ),
//                   // ),
//                 ],
//               ),
//             );
//           }
//         },
//         error: (error, stackTrace) {
//           return const ErrorAnimationView();
//         },
//         loading: () {
//           return const LoadingAnimationView();
//         },
//       ),
//     );
//   }
// }
