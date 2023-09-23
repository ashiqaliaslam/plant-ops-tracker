import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/navigation/navigation_drawer.dart';
import 'package:plant_ops_tracker/views/tabs/audits/current_audits.dart';
import 'package:plant_ops_tracker/views/tabs/audits/custom_search_audits.dart';
import 'package:plant_ops_tracker/views/tabs/audits/today_audits.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daily Audits'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.today)),
              Tab(icon: Icon(Icons.calendar_month)),
              Tab(icon: Icon(Icons.search)),
            ],
          ),
        ),
        // body: const Text('Daily Audits'),
        body: const TabBarView(
          children: [
            CurrentAuditsView(),
            TodayAuditsView(),
            CustomSearchAuditsView(),
          ],
        ),
        drawer: const AppDrawer(),
        // endDrawer: ,
        backgroundColor: Colors.red,
      ),
    );
  }
}
