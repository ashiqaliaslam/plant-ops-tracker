import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/navigation/navigation_drawer.dart';

class StandingOrderView extends StatelessWidget {
  const StandingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standing Orders'),
      ),
      body: const Text('Standing Orders View'),
      drawer: const AppDrawer(),
      backgroundColor: Colors.amber,
    );
  }
}
