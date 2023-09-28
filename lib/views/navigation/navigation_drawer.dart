import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/app_state.dart';
import 'package:plant_ops_tracker/state/auth/buttons.dart';
import 'package:plant_ops_tracker/state/auth/notifiers/app_state.dart';

/// [Flutter Navigation with Router Go, article]
// https://www.rootstrap.com/blog/flutter-navigation-with-router-go
class AppDrawer extends ConsumerWidget {
  //  AppDrawer({
  //   Key? key,
  // }) : super(key: key ?? const ValueKey<String>('AppDrawer'));

  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(applicationStateProvider);
    return NavigationDrawer(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(appState.username),
          accountEmail: Text(appState.email),
          currentAccountPicture: appState.photoURL.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(appState.photoURL),
                )
              : const Icon(
                  Icons.account_circle,
                  size: 70,
                ),

          // ? CircleAvatar(
          //     backgroundImage: NetworkImage(appState.photoURL),
          //   )
          // : const CircleAvatar(
          //     child: Icon(
          //       Icons.account_circle,
          //       size: 70,
          //     ),
          //   ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Header',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Consumer(
          builder: (context, ref, _) {
            return Row(
              children: [
                LoginLogoutButton(
                  loggedIn: appState.loggedIn,
                  signOut: () => FirebaseAuth.instance.signOut(),
                ),
                ProfileButton(loggedIn: appState.loggedIn),
              ],
            );
          },
        ),
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