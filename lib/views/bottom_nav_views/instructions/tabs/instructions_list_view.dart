import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/extensions/log.dart';
import 'package:plant_ops_tracker/state/instructions/providers/all_instructions_provider.dart';
import 'package:plant_ops_tracker/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:plant_ops_tracker/views/components/animations/error_animation_view.dart';
import 'package:plant_ops_tracker/views/components/animations/loading_animation_view.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';

class InstructionsListView extends ConsumerWidget {
  const InstructionsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final instructions = ref.watch(allInstructionsProvider);
    return RefreshIndicator(
      onRefresh: () async {
        'refresh started'.log();
        return await ref.refresh(allInstructionsProvider.future);
      },
      child: instructions.when(
        data: (instructions) {
          if (instructions.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
                text: Strings.noInstruction);
          } else {
            return Scaffold(
              body: ListView.builder(
                itemCount: instructions.length,
                itemBuilder: (context, index) {
                  final instruction = instructions.elementAt(index);
                  final title = Text(
                    instruction.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  );
                  final description =
                      Text(instruction.description ?? 'No Description');
                  final createdAt =
                      Text(instruction.createdAt?.toString() ?? '');

                  // final departments = Text(instruction.department?.name ?? '');
                  // final department =
                  //     Department.parse(dd);

                  // return Card(
                  //   child: ListTile(
                  //     title: title,
                  //     subtitle: Column(children: [
                  //       description,
                  //       createdAt,
                  //     ]),
                  //   ),
                  // );
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title,
                          const SizedBox(height: 2),
                          description,
                          const SizedBox(height: 10),
                          createdAt,
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8.0, // gap between adjacent chips
                            runSpacing: 4.0, // gap between lines
                            children: instruction.department
                                .map((department) =>
                                    Chip(label: Text(department?.name ?? '')))
                                .toList(),
                          )

                          // departments,

                          // if (instruction.steps != null) ...[
                          //   Text('Steps:'),
                          //   for (var step in instruction.steps!) Text('- $step'),
                          // ],
                          // if (instruction.department != null) Text('Department: ${instruction.department}'),
                          // if (instruction.createdAt != null) Text('Created At: ${instruction.createdAt}'),
                          // if (instruction.updatedAt != null) Text('Updated At: ${instruction.updatedAt}'),
                          // Text('Instruction Issuer: ${instruction.instructionIssuer}'),
                          // if (instruction.priority != null) Text('Priority: ${instruction.priority}'),
                          // Text('Is Active: ${instruction.isActive ? 'Yes' : 'No'}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // ),
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
