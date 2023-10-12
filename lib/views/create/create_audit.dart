import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/audits/providers/create_audit_provider.dart';
import 'package:plant_ops_tracker/state/auth/providers/user_id_provider.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';

class CreateNewAuditView extends StatefulHookConsumerWidget {
  // final String auditTitle;
  // final List<ShiftGroup> dueShifts;

  const CreateNewAuditView({
    super.key,
    // required this.auditTitle,
    // required this.dueShifts,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateNewAuditViewState();
}

class _CreateNewAuditViewState extends ConsumerState<CreateNewAuditView> {
  @override
  Widget build(BuildContext context) {
    // final userId = ref.watch(applicationStateProvider).userId;
    final auditController = useTextEditingController();
    final isAuditButtonEnabled = useState(false);
    // final List<ShiftGroup> dueShiftGroups = [ShiftGroup.morningShift];
    // ShiftGroup? selectedShiftGroup;

    useEffect(() {
      void listener() {
        isAuditButtonEnabled.value = auditController.text.isNotEmpty;
      }

      auditController.addListener(listener);
      return () {
        auditController.removeListener(listener);
      };
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createAudit),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: isAuditButtonEnabled.value
                ? () async {
                    final auditTitle = auditController.text;
                    final userId = ref.read(userIdProvider);
                    if (userId == null) {
                      return;
                    }

                    final isCreated = await ref
                        .read(createAuditProvider.notifier)
                        .createAudit(
                          userId: userId,
                          auditTitle: auditTitle,
                          // dueShifts: dueShiftGroups,
                        );
                    if (isCreated && mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                : null,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: auditController,
              autofocus: true,
              maxLines: null,
              decoration:
                  const InputDecoration(labelText: Strings.createAuditHere),
            ),
          ),

          // DropdownButton<ShiftGroup>(
          //   hint: const Text("Select Shift Group"),
          //   value: selectedShiftGroup,
          //   onChanged: (ShiftGroup? newGroup) {
          //     setState(() {
          //       selectedShiftGroup = newGroup;
          //       if (newGroup != null) {
          //         dueShiftGroups.add(newGroup);
          //       }
          //     });
          //   },
          //   items: ShiftGroup.values
          //       .map<DropdownMenuItem<ShiftGroup>>((ShiftGroup shiftGroup) {
          //     return DropdownMenuItem<ShiftGroup>(
          //       value: shiftGroup,
          //       child: Text(shiftGroup.toString().split('.').last),
          //     );
          //   }).toList(),
          // ),
        ],
      )),
    );
  }
}
