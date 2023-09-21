import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_ops_tracker/views/navigation/scaffold_with_navbar.dart';
import 'package:plant_ops_tracker/views/tabs/audit_list_view.dart';
import 'package:plant_ops_tracker/views/tabs/changeover_list_view.dart';
import 'package:plant_ops_tracker/views/tabs/talk_list_view.dart';

import 'views/profile_view.dart';
import 'views/login/login_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Plant Ops Tracker',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

// https://github.dev/flutter/packages/blob/main/packages/go_router/example/lib/named_routes.dart
// https://github.dev/bizz84/nested_navigation_examples/blob/main/examples/gorouter/lib/main.dart
// https://github.dev/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/routing/app_router.dart

final _router = GoRouter(
  initialLocation: '/audits',
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const AuditListView(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return const SignInView();
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                final arguments = state.uri.queryParameters;
                return ForgotPasswordScreen(
                  email: arguments['email'],
                  headerMaxExtent: 200,
                );
              },
            )
          ],
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return const ProfileView();
          },
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavgationBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _auditsViewNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/audits',
              builder: (context, state) => const AuditListView(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _talksViewNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/talks',
              builder: (context, state) => const TalkListView(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _changeoversViewNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/changeovers',
              builder: (context, state) => const ChangeOverListView(),
            ),
          ],
        ),
      ],
    ),
  ],
);

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _auditsViewNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'audits');
final GlobalKey<NavigatorState> _talksViewNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'talks');
final GlobalKey<NavigatorState> _changeoversViewNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'changeovers');




  // Widget buildDrawerScaffold(BuildContext context) {
  //   return Scaffold(
  //     key: scaffoldKey,
  //     body: SafeArea(
  //       bottom: false,
  //       top: false,
  //       child: Row(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 5),
  //             child: NavigationRail(
  //               minWidth: 50,
  //               selectedIndex: widget.navigationShell.currentIndex,
  //               useIndicator: true,
  //               onDestinationSelected: (int index) =>
  //                   _onDestinationSelected(context, index),
  //               destinations: DestinationList.allDestinations
  //                   .map((Destination destination) {
  //                 return NavigationRailDestination(
  //                   icon: destination.icon,
  //                   selectedIcon: destination.selectedIcon,
  //                   label: Text(destination.label),
  //                 );
  //               }).toList(),
  //             ),
  //           ),
  //           const VerticalDivider(thickness: 1, width: 1),
  //           Expanded(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Text('Page Index = ${widget.navigationShell.currentIndex}'),
  //                 ElevatedButton(
  //                   onPressed: () {}, // TODO:
  //                   child: const Text('Open Drawer'),
  //                 )
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //     // endDrawer: NavigationDrawer(
  //     //   onDestinationSelected: (int index) =>
  //     //       _onDestinationSelected(context, index),
  //     //   selectedIndex: widget.navigationShell.currentIndex,
  //     //   children: [
  //     //     Padding(
  //     //       padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
  //     //       child: Text(
  //     //         'Header',
  //     //         style: Theme.of(context).textTheme.titleSmall,
  //     //       ),
  //     //     ),
  //     //     ...DestinationList.allDestinations.map(
  //     //       (Destination destination) {
  //     //         return NavigationDrawerDestination(
  //     //           icon: destination.icon,
  //     //           selectedIcon: destination.selectedIcon,
  //     //           label: Text(destination.label),
  //     //         );
  //     //       },
  //     //     ),
  //     //     const Padding(
  //     //       padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
  //     //       child: Divider(),
  //     //     )
  //     //   ],
  //     // ),
  //   );
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return showNavigationDrawer
  //       ? buildDrawerScaffold(context)
  //       : buildBottomBarScaffold();
  // }