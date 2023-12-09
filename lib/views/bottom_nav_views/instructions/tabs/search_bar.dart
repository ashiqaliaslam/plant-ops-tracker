import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/state/instructions/models/instructions.dart';

class InstructionSearchBar extends StatelessWidget {
  // final TextEditingController controller;
  // final Function(String) onChanged;
  final List<Instruction> instructionList;
  final ValueNotifier<List<Instruction>> filteredInstructions;
  final Function(List<Instruction>) onInstructionSelected;

  const InstructionSearchBar({
    super.key,
    // required this.controller,
    // required this.onChanged,
    required this.instructionList,
    required this.filteredInstructions,
    required this.onInstructionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, searchController) {
        return SearchBar(
          controller: searchController,
          // onTap: () {
          //   searchController.openView();
          // },
          onChanged: (value) {
            final lowerCaseValue = value.trim().toLowerCase();
            if (lowerCaseValue.isEmpty) {
              filteredInstructions.value = instructionList;
            } else {
              filteredInstructions.value = instructionList.where((instruction) {
                return instruction.title
                        .toLowerCase()
                        .contains(lowerCaseValue) ||
                    instruction.description!
                        .toLowerCase()
                        .contains(lowerCaseValue) ||
                    instruction.instructionIssuer!.name
                        .toLowerCase()
                        .contains(lowerCaseValue) ||
                    instruction.priority!.name
                        .toLowerCase()
                        .contains(lowerCaseValue) ||
                    instruction.department.any((department) => department!.name
                        .toLowerCase()
                        .contains(lowerCaseValue));
              }).toList();
            }
          },
          hintText: 'Search Standing Orders...',
          leading: const Icon(Icons.search),
          trailing: [
            if (searchController.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  searchController.clear();
                  filteredInstructions.value = instructionList;
                  //  dismissKeyboard();
                },
              ),
          ],
        );
      },
      suggestionsBuilder: (context, searchController) {
        return List<ListTile>.generate(filteredInstructions.value.length,
            (index) {
          final instruction = filteredInstructions.value.elementAt(index);
          return ListTile(
            title: Text(instruction.title),
            onTap: () {
              onInstructionSelected([instruction]);
              searchController.closeView(instruction.title);
              // setState(() {
              //   searchController.closeView(instruction.title);
              //   // Update the filteredInstructions state directly
              //   filteredInstructions.value = [instruction];
              // });
            },
          );
        });
      },
    );
  }
}
