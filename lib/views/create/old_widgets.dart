
/// [Priority Selection - Dropdown]
// DropdownButtonFormField<PriorityLevel>(
//   decoration: const InputDecoration(
//     labelText: 'Priority',
//     hintText: 'Select Priority',
//   ),
//   items: PriorityLevel.values.map((priority) {
//     return DropdownMenuItem<PriorityLevel>(
//       value: priority,
//       child: Text(priority.name),
//     );
//   }).toList(),
//   onChanged: (priority) {
//     setState(() {
//       priorityController.text =
//           priority.toString().split('.').last;
//     });
//   },
// ),


/// [Select Departments - Popup Checklist - not rebuilding the widget]
// Column(
//   children: [
//     ElevatedButton(
//       onPressed: () async {
//         final selected = await showMenu(
//             context: context,
//             position: RelativeRect.fill,
//             items: Department.values.map((department) {
//               return PopupMenuItem(
//                 value: department,
//                 child: CheckboxListTile(
//                   value: selectedDepartments.value
//                       .contains(department),
//                   onChanged: (isSelected) {
//                     if (isSelected == true) {
//                       selectedDepartments.value.add(department);
//                     } else {
//                       selectedDepartments.value
//                           .remove(department);
//                     }
//                   },
//                   title: Text(department.name),
//                 ),
//               );
//             }).toList());
//         if (selected != null &&
//             !selectedDepartments.value.contains(selected)) {
//           selectedDepartments.value.add(selected);
//         }
//       },
//       child: const Text('Select Departments'),
//     ),
//     Wrap(
//       spacing: 5,
//       children: selectedDepartments.value.map((department) {
//         return FilterChip.elevated(
//             label: Text(department.name),
//             onSelected: (_) {
//               selectedDepartments.value.remove(department);
//             });
//       }).toList(),
//     )
//   ],
// ),




/// [Select Departments via multi-select]
// MultiSelectDialogField<Department>(
//   items: Department.values
//       .map((depart) =>
//           MultiSelectItem<Department>(depart, depart.name))
//       .toList(),
//   onConfirm: (values) {
//     departmentsList.value = values;
//   },
// ),
