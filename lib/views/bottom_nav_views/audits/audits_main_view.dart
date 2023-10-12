import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/audits/tabs/custom_search_audits.dart';
import 'package:plant_ops_tracker/views/create/create_audit.dart';
import 'package:plant_ops_tracker/views/navigation/navigation_drawer.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/audits/tabs/current_audits.dart';
import 'package:plant_ops_tracker/views/bottom_nav_views/audits/tabs/today_audits.dart';

class AuditsMainView extends ConsumerWidget {
  const AuditsMainView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const tabBars = [
      Tab(icon: Icon(Icons.today)),
      Tab(icon: Icon(Icons.calendar_month)),
      Tab(icon: Icon(Icons.search)),
    ];
    const tabBarChildren = [
      CurrentAuditsView(),
      TodayAuditsView(),
      CustomSearchAuditsView(),
    ];
    return DefaultTabController(
      length: tabBars.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daily Audits'),
          bottom: const TabBar(
            tabs: tabBars,
          ),
        ),
        body: const TabBarView(
          children: tabBarChildren,
        ),
        drawer: const AppDrawer(),
        floatingActionButton: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateNewAuditView(),
                    ),
                  );
                },
                child: const Icon(Icons.add),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
