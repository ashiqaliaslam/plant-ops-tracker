import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StepsListView extends HookWidget {
  final List<String> stepsList;

  const StepsListView({
    Key? key,
    required this.stepsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: stepsList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(stepsList[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}


// class StepsReorderableListView extends HookWidget {
//   final List<String> stepsList;

//   const StepsReorderableListView({
//     super.key,
//     required this.stepsList,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(5)),
//       padding: const EdgeInsets.all(8),
//       child: ReorderableListView.builder(
//         shrinkWrap: true,
//         itemCount: stepsList.length,
//         itemBuilder: (BuildContext context, int index) {
//           // return Row(
//           //   children: [
//           //     ReorderableDragStartListener(
//           //       index: index,
//           //       child: const Icon(Icons.drag_handle),
//           //     ),
//           //   ],
//           // );
//           return ListTile(
//             key: Key(stepsList[index]),
//             leading: ReorderableDragStartListener(
//               index: index,
//               child: const Icon(Icons.drag_handle),
//             ),
//             title: Text(stepsList[index]),
//           );
//         },
//         onReorder: (int oldIndex, int newIndex) {
//           if (oldIndex < newIndex) {
//             newIndex -= 1;
//           }
//           final String step = stepsList.removeAt(oldIndex);
//           stepsList.insert(newIndex, step);
//         },
//       ),
//     );
//   }
// }
