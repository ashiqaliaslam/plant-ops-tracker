import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/extensions/log.dart';
import 'package:plant_ops_tracker/state/instructions/providers/all_instructions_provider.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/tabs/instruction_detail_view.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/tabs/instruction_thumbnail_view.dart';
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
                          transitionDuration: const Duration(milliseconds: 200),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
