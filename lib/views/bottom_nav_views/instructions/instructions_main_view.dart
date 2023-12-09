import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/instructions/tabs/instructions_list_view.dart';
import 'package:plant_ops_tracker/views/create/create_instructions/create_instruction.dart';
import 'package:plant_ops_tracker/views/navigation/navigation_drawer.dart';

class InstructionsMainView extends ConsumerWidget {
  const InstructionsMainView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standing Orders'),
      ),
      body: const InstructionsListView(),
      drawer: const AppDrawer(),
      floatingActionButton: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateInstructionView(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
