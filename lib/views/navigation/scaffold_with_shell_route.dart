// import 'package:flutter/material.dart';
// import 'package:plant_ops_tracker/state/navigation_destinations.dart/destinations.dart';

// class ScaffoldWithShellRoute extends StatelessWidget {
//   const ScaffoldWithShellRoute({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         // selectedIndex: widget.navigationShell.currentIndex,
//         // onDestinationSelected: (int index) =>
//         //     _onDestinationSelected(context, index),
//         destinations:
//             DestinationList.allDestinations.map((Destination destination) {
//           return NavigationDestination(
//             icon: destination.icon,
//             selectedIcon: destination.selectedIcon,
//             label: destination.label,
//             tooltip: destination.label,
//           );
//         }).toList(),
//       ),
//     );
//   }

//   // void _onDestinationSelected(BuildContext context, int index) {
//   //   widget.navigationShell.goBranch(
//   //     index,
//   //     initialLocation: index == widget.navigationShell.currentIndex,
//   //   );
//   // }
// }
