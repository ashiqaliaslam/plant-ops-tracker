// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class StepsReorderableList extends HookWidget {
//   final List<String> stepsList;

//   const StepsReorderableList({
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
//           return ListTile(
//             key: Key(stepsList[index]),
//             leading: ReorderableDragStartListener(
//               index: index,
//               child: const Icon(Icons.drag_handle),
//             ),
//             title: TextFormField(
//               initialValue: stepsList[index],
//               onChanged: (value) {
//                 stepsList[index] = value;
//               },
//             ),
//             // trailing: IconButton(
//             //   icon: const Icon(Icons.delete),
//             //   onPressed: () {
//             //     stepsList.removeAt(index);
//             //   },
//             // ),
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
