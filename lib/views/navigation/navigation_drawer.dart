import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/providers/authenticated_user_provider.dart';
import 'package:plant_ops_tracker/views/widgets/profile_button.dart';
import 'package:plant_ops_tracker/views/widgets/signin_signout_button.dart';

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
        Consumer(
          builder: (context, ref, _) {
            final loggedIn = authenticatedUser.isAlreadyLoggedIn;

            return Row(
              children: [
                LoginLogoutButton(loggedIn: loggedIn),
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
