import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/navigation/navigation_drawer.dart';

class ChangeOverListView extends StatelessWidget {
  const ChangeOverListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Overs Schedule'),
      ),
      body: const Text('Change overs list'),
      drawer: const AppDrawer(),
      backgroundColor: Colors.blue,
    );
  }
}
