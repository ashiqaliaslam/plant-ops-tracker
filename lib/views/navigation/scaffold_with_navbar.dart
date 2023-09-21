import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_ops_tracker/old/destinations.dart';

class ScaffoldWithNavgationBar extends StatefulWidget {
  const ScaffoldWithNavgationBar({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavigationBar'));

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavgationBar> createState() =>
      _ScaffoldWithNavgationBarState();
}

class _ScaffoldWithNavgationBarState extends State<ScaffoldWithNavgationBar> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // late bool showNavigationDrawer;

  // get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (int index) =>
            _onDestinationSelected(context, index),
        // onDestinationSelected: _onDestinationSelected123,
        destinations:
            DestinationList.allDestinations.map((Destination destination) {
          return NavigationDestination(
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
            label: destination.label,
            tooltip: destination.label,
          );
        }).toList(),
      ),
    );
  }

  void _onDestinationSelected(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
