import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/providers/auth_state_provider.dart';
import 'package:plant_ops_tracker/state/auth/providers/authenticated_user_provider.dart';
import 'package:plant_ops_tracker/views/components/dialogs/alert_dialog_model.dart';
import 'package:plant_ops_tracker/views/components/dialogs/logout_dialog.dart';
import 'package:plant_ops_tracker/views/widgets/profile_button.dart';

/// [Flutter Navigation with go_router, article]
// https://www.rootstrap.com/blog/flutter-navigation-with-router-go
class AppDrawer extends ConsumerWidget {
  //  AppDrawer({
  //   Key? key,
  // }) : super(key: key ?? const ValueKey<String>('AppDrawer'));

  const AppDrawer({
    super.key,
    this.popOnSelection = false,
  });

  final bool popOnSelection;
  // const AppDrawer({super.key});

  // static final GlobalKey<ScaffoldState> scaffoldKey =
  //     GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appState = ref.watch(userInfoProvider);
    // final userInfo = ref.watch(userInfoProvider());
    final authenticatedUser = ref.watch(authenticatedUserProvider);
    return NavigationDrawer(
      // onDestinationSelected: (value) {
      //   if (popOnSelection) Navigator.pop(context);
      // },
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(authenticatedUser.displayName),
          accountEmail: Text(authenticatedUser.email),
          currentAccountPicture: authenticatedUser.photoUrl.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(authenticatedUser.photoUrl),
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
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
        //   child: Text(
        //     'Header',
        //     style: Theme.of(context).textTheme.titleSmall,
        //   ),
        // ),
        Consumer(
          builder: (context, ref, _) {
            // final loggedIn = ref.watch(isLoggedInProvider);
            final loggedIn = authenticatedUser.isAlreadyLoggedIn;
            // final signOut = ref.read(authStateProvider.notifier).logOut();

            return Row(
              children: [
                TextButton(
                  onPressed: () async {
                    if (!loggedIn) {
                      context.push('/sign-in');
                    } else {
                      final shouldLogOut = await const LogoutDialog()
                          .present(context)
                          .then((value) => value ?? false);
                      if (shouldLogOut) {
                        await ref.read(authStateProvider.notifier).logOut();
                        // ref.read(authStateProvider.notifier).logOut().log();
                        // Navigator.pop();
                      }
                    }
                  },
                  child: !loggedIn
                      ? const Text('Sign in to Create')
                      : const Text('Log out'),
                ),
                //          child: StyledButton(
                // onPressed: () {
                //   !loggedIn ? context.push('/sign-in') : logOut;
                // },
                // child: !loggedIn
                //     ? const Text('Sign In to Create')
                //     : const Text('Logout')),

                // LoginLogoutButton(loggedIn: loggedIn, signOut: signOut);
                // LoginLogoutButton(
                //   loggedIn: loggedIn,
                //   // signOut: () => signOut,
                // ),
                ProfileButton(loggedIn: loggedIn),
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