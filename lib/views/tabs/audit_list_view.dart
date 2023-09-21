import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/navigation/navigation_drawer.dart';

class AuditListView extends StatefulWidget {
  const AuditListView({
    super.key,
  });

  @override
  State<AuditListView> createState() => _AuditListViewState();
}

class _AuditListViewState extends State<AuditListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Audits'),
      ),
      body: const Text('Audit List View'),
      drawer: const AppDrawer(),
      // endDrawer: ,
      backgroundColor: Colors.red,
    );
  }
}
