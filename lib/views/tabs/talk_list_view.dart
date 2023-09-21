import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/navigation/navigation_drawer.dart';

class TalkListView extends StatelessWidget {
  const TalkListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HSE Talks'),
      ),
      body: const Text('Talk List View'),
      drawer: const AppDrawer(),
      backgroundColor: Colors.green,
    );
  }
}
