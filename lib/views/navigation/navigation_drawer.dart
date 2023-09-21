import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/app_state.dart';
import 'package:plant_ops_tracker/state/auth/auth_function.dart';

class AppDrawer extends ConsumerWidget {
  //  AppDrawer({
  //   Key? key,
  // }) : super(key: key ?? const ValueKey<String>('AppDrawer'));

  const AppDrawer({super.key});

  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    return NavigationDrawer(
      // onDestinationSelected: (int index) =>
      //     _onDestinationSelected(context, index),
      // selectedIndex: _calculateSelectedIndex(context),
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('aali'),
          accountEmail: Text('example@abc.com'),
          currentAccountPicture: FlutterLogo(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Header',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // Consumer(
        //   builder: (context, ref, child) {
        //     return LoggedInView(
        //       loggedIn: appState.loggedIn,
        //       signOut: () {
        //         FirebaseAuth.instance.signOut();
        //       },
        //     );
        //   },
        // ),
        Consumer(
          builder: (context, ref, _) {
            return AuthFunc(
              loggedIn: !appState.loggedIn,
              signOut: () => FirebaseAuth.instance.signOut(),
            );
          },
        ),
        // Consumer<ApplicationState>(
        //   builder: (context, appState, _) => AuthFunc(
        //     loggedIn: appState.loggedIn,
        //     signOut: () {
        //       FirebaseAuth.instance.signOut();
        //     },
        //     // enableFreeSwag: appState.enableFreeSwag,
        //   ),
        // ),

        // ...DestinationList.allDestinations.map(
        //   (Destination destination) {
        //     return NavigationDrawerDestination(
        //       icon: destination.icon,
        //       selectedIcon: destination.selectedIcon,
        //       label: Text(destination.label),
        //     );
        //   },
        // ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        )
      ],
    );
  }
}

// NavigationDrawer(
// onDestinationSelected: (int index) =>
//     _onDestinationSelected(context, index),
// selectedIndex: widget.navigationShell.currentIndex,
// children: [
//   Padding(
//     padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
//     child: Text(
//       'Header',
//       style: Theme.of(context).textTheme.titleSmall,
//     ),
//   ),
//   ...DestinationList.allDestinations.map(
//     (Destination destination) {
//       return NavigationDrawerDestination(
//         icon: destination.icon,
//         selectedIcon: destination.selectedIcon,
//         label: Text(destination.label),
//       );
//     },
//   ),
//   const Padding(
//     padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
//     child: Divider(),
//   )
// ],
// ),