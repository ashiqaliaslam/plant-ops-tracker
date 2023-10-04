import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/audits/tabs/custom_search_audits.dart';
import 'package:plant_ops_tracker/views/navigation/navigation_drawer.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/audits/tabs/current_audits.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/audits/tabs/today_audits.dart';

class AuditListView extends ConsumerWidget {
  const AuditListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daily Audits'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.today),
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CurrentAuditsView(),
            TodayAuditsView(),
            CustomSearchAuditsView(),
          ],
        ),
        drawer: const AppDrawer(),
        backgroundColor: Colors.red,
      ),
    );
  }
}
